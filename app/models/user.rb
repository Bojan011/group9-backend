class User < ActiveRecord::Base
  before_save :ensure_authentication_token
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  #devise :database_authenticatable, :registerable,
  #     :recoverable, :rememberable, :trackable, :validatable,
  #     :confirmable, :token_authenticatable
  # Setup accessible (or protected) attributes for your model
  ##need to add :stats to table here
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
                  :health, :attack, :defend, :gender, :dodge, :experience, :level,
                  :regen, :armour, :charName
  # attr_accessible :title, :body

  include Mailboxer::Models::Messageable
  acts_as_messageable
  def name
    self.to_s
  end
  def mailboxer_email(message)
    email
  end
  def to_s
    email
  end
end
