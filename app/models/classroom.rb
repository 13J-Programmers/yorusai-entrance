class Classroom < ApplicationRecord
  has_many :students

  validates :grade, presence: true
  validates :classname, presence: true

  def abbr
    case self.grade
    when 1..2
      "#{self.grade}-#{self.classname}" # => 1-1 1-2 ...
    when 3..5
      "#{self.grade}#{self.classname}" # => 3M 3E ...
    else
      raise 'Classroom column "grade" is expected to be integer and be between 1 and 5'
    end
  end

  def self.find_by_abbr(classroom_abbr)
    classrooms = Classroom.all.map { |classroom| [classroom.abbr, classroom] }.to_h
    classroom = classrooms[classroom_abbr]
  end
end
