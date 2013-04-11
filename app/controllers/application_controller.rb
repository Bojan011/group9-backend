class ApplicationController < ActionController::Base
   #skip authentication	
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  protect_from_forgery
end
