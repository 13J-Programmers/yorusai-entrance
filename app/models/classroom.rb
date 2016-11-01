class Classroom < ApplicationRecord
  validates :class_id, presence: true, uniqueness: true
end
