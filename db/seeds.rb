# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# drop student and classroom table
Student.destroy_all
Classroom.destroy_all

# --- create classrooms ---

(1..2).each do |grade|
  (1..5).each do |sub|
    Classroom.create(grade: grade, classname: sub)
  end
end
(3..5).each do |grade|
  %w(M E S J C).each do |sub|
    Classroom.create(grade: grade, classname: sub)
  end
end
Classroom.create(grade: 6, classname: "専攻科")


# --- create students ---

# grade 1..2
(15..16).each do |digit|
  (1..5).each do |sub|
    classroom = Classroom.find_by(grade: Student.digit_to_grade(digit), classname: sub)
    (1..rand(35..40)).each do |num|
      student_id = sprintf("%02d%1d%02d", digit, sub, num)
      classroom.students.create(student_id: student_id)
    end
  end
end

# grade 3..5
(12..14).each do |digit|
  (1..5).each do |sub|
    dept = %w(M E S J C)[sub-1]
    classroom = Classroom.find_by(grade: Student.digit_to_grade(digit), classname: dept)
    (1..rand(35..40)).each do |num|
      student_id = sprintf("%02d%1d%02d", digit, sub, num)
      classroom.students.create(student_id: student_id)
    end
  end
end

# move to other dept
20.times do
  student = Student.offset(rand(Student.count)).first
  grade = student.classroom.grade
  next if grade <= 2
  student.classroom = Classroom.find_by(grade: grade, classname: %w(M E S J C)[rand(5)])
  student.save
end

# grade 6..7 (Advanced Cource)
(10..11).each do |digit|
  classroom = Classroom.find_by(grade: 6)

  20.times do
    sub = rand(1..5)
    num = rand(1..40)
    student_id = sprintf("%02d%1d%02d", digit, sub, num)
    next if classroom.students.find_by(student_id: student_id)
    classroom.students.create(student_id: student_id)
  end
end
