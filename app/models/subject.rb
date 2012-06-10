class Subject < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :status, :semester, :user_id
  validates_presence_of :name, :status, :semester

  scope :by_status_desc, where('status >= ?', '').order('subjects.status DESC')
end