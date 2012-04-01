class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  has_many :subjects
  has_many :schedules

  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
end