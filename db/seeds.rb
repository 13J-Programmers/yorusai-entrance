# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Student.create(student_id: 12345, attended: false, elected: false)
# Student.create(student_id: 67890, attended: false, elected: false)
# Student.create(student_id: 13426, attended: false, elected: false)

(11..16).each do |grade|
  (1..5).each do |sub|
    (1..40).each do |num|
      student_id = sprintf("%02d%1d%02d", grade, sub, num)
      Student.create(student_id: student_id, attended: false, elected: false)
    end
  end
end
