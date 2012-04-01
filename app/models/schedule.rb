class Schedule < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :date, :remember_me
end
