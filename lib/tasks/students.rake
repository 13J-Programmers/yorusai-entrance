namespace :students do
  desc "drop students table"
  task :drop => :environment do
    Student.destroy_all
  end

  desc "attend students at random"
  task :attend_at_random => :environment do
    100.times do
      student = Student.offset(rand(Student.count)).first
      student.attended = true
      student.save
    end
  end

  desc "reset all students' elected flag"
  task :reset_elected => :environment do
    Student.update_all("elected = 'f'")
  end

  desc "reset all students' attended flag"
  task :reset_attended => :environment do
    Student.update_all("attended = 'f'")
  end
end
