class Schedule < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :date, :remember_me, :user_id
  validates_presence_of :description, :date
end
