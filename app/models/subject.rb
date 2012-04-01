class Subject < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :status, :semester
end