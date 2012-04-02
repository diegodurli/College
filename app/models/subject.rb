class Subject < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :status, :semester, :user_id
  validates_presence_of :name, :status, :semester

  scope :by_status_desc, where('status >= ?', '').order('subjects.status DESC')

  def self.subjects_by_status
    subjects_by_status = ""

    Subject.group("status").count.each do |status, value|
      subjects_by_status << "['#{status}',#{value}],"
    end

    subjects_by_status
  end

  def self.count_by_status
    subjects = { completed: 0, pending: 0, registered: 0 }

    Subject.group('status').count.each do |key, value|
      subjects.merge!({ key.downcase.to_sym => value })
    end

    subjects
  end
end