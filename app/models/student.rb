class Student < ApplicationRecord
  #
  # culculate grade from its student_id
  #
  def grade
    raise "this system is able to use in 2005-2099." unless Time.now.year.between?(2005, 2099)
    entered_year = self.student_id.to_s[0..1].to_i
    current_year = Time.now.year.to_s[2..3].to_i
    current_year - entered_year + 1
  end

  #
  # culculate student_id's first 2 digit from grade
  #
  def self.grade_to_digit(grade)
    raise "this system is able to use in 2005-2099." unless Time.now.year.between?(2005, 2099)
    current_year = Time.now.year.to_s[2..3].to_i
    current_year - grade + 1
  end
end
