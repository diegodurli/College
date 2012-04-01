class User < ActiveRecord::Base
  has_secure_password

  has_many :subjects, :schedules
  attr_accessible :name, :email, :password, :password_confirmation

  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
end
