class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  has_many :subjects
  has_many :schedules

  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
  
  before_create { generate_token(:auth_token) }
  
  private
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end