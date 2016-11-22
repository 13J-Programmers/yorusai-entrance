class Classroom < ApplicationRecord
  has_many :students

  validates :grade, presence: true
  validates :classname, presence: true

  def abbr
    case self.grade
    when "1".."2"
      "#{self.grade}-#{self.classname}" # => 1-1 1-2 ...
    when "3".."5"
      "#{self.grade}#{self.classname}" # => 3M 3E ...
    end
  end
end
