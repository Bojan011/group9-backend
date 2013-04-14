class Api::V1::SessionsController < Devise::SessionsController
  #skip authentication
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  def create
    respond_to do |format|
      format.html { super }
      format.json {
        warden.authenticate!(:scope => :user, :recall => "sessions#new")
        #error =>success
        render :status => 200, :json => {:success => true,
                      :info => "Logged in",
                      :data => { :id => current_user.id, :auth_token => current_user.authentication_token } }
      }
    end
  end

  def destroy
    #super
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_user.update_column(:authentication_token, nil)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end
end