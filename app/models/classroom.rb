class Classroom < ApplicationRecord
  has_many :students

  validates :grade, presence: true
  validates :grade, numericality: {
              only_integer: true, greater_than: 0, less_than: 7
            }
  validates :classname, presence: true

  def abbr
    Classroom.abbr(grade: self.grade, classname: self.classname)
  end

  def self.abbr(grade:, classname:)
    case grade
    when 1..2
      "#{grade}-#{classname}" # => 1-1 1-2 ...
    when 3..5
      "#{grade}#{classname}" # => 3M 3E ...
    when 6
      "#{classname}" # => 専攻科
    end
  end

  def self.find_by_abbr(classroom_abbr)
    classrooms = Classroom.all.map { |classroom| [classroom.abbr, classroom] }.to_h
    classroom = classrooms[classroom_abbr]
  end
end
