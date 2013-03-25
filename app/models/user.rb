class User < ActiveRecord::Base
  before_save :ensure_authentication_token
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable
  #devise :database_authenticatable, :registerable,
  #     :recoverable, :rememberable, :trackable, :validatable,
  #     :confirmable, :token_authenticatable
  # Setup accessible (or protected) attributes for your model
  ##need to add :stats to table here
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  def skip_confirmation!
   self.confirmed_at = Time.now
  end
end
