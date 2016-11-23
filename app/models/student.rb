require 'csv'

class Student < ApplicationRecord
  belongs_to :classroom

  before_save do
    if self.attended.blank?
      self.attended_at = nil
    end
    if self.elected.blank?
      self.elected_at = nil
    end
  end

  # student_id
  validates :student_id,
    presence: true,
    uniqueness: true,
    format: { with: /\A[0-9][0-9][1-5][0-9][0-9]\z/ }

  #
  # culculate student_id's first 2 digit from grade
  #
  def self.grade_to_digit(grade)
    raise "this system is able to use in 2005-2099." unless Time.now.year.between?(2005, 2099)
    current_year = Time.now.year.to_s[2..3].to_i
    current_year - grade + 1
  end

  #
  # culculate grade from student_id
  #
  def self.digit_to_grade(student_id)
    raise "this system is able to use in 2005-2099." unless Time.now.year.between?(2005, 2099)
    entered_year = student_id.to_s[0..1].to_i
    current_year = Time.now.year.to_s[2..3].to_i
    current_year - entered_year + 1
  end

  #
  # import from csv
  #
  def self.import(file)
    registered = 0
    CSV.foreach(file.path, headers: true) do |row|
      student = find_by(student_id: row["student_id"])
      if student.nil?
        student = new(student_id: row["student_id"], dept: row["dept"], class_id: row["class_id"], grade: row["grade"])
        student.save! && registered += 1
      end
    end
    return registered
  end
end
