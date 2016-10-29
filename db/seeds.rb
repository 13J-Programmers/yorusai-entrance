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

# grade 1..2
(15..16).each do |grade|
  (1..5).each do |sub|
    (1..rand(35..40)).each do |num|
      student_id = sprintf("%02d%1d%02d", grade, sub, num)
      Student.create(student_id: student_id, class_id: sub)
    end
  end
end

# grade 3..5
(12..14).each do |grade|
  (1..5).each do |sub|
    dept = %w(M E S J C)[sub-1]
    (1..rand(35..40)).each do |num|
      student_id = sprintf("%02d%1d%02d", grade, sub, num)
      Student.create(student_id: student_id, dept: dept)
    end
  end
end

# move to other dept
20.times do
  student = Student.offset(rand(Student.count)).first
  next if student.grade <= 2
  student.dept = %w(M E S J C)[rand(5)]
  student.save
end

(1..2).each do |grade|
  (1..5).each do |sub|
    class_id = "#{grade}-#{sub}"
    Classroom.create(class_id: class_id, elected: false)
  end
end

(3..5).each do |grade|
  %w(M E S J C).each do |sub|
    class_id = "#{grade}#{sub}"
    Classroom.create(class_id: class_id, elected: false)
  end
end
