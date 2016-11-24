namespace :students do
  desc "drop students table"
  task :drop => :environment do
    Student.destroy_all
  end

  desc "attend students at random"
  task :attend_at_random => :environment do
    def rand_time(range)
      from = range.begin.to_f
      to   = range.end.to_f
      Time.at(rand * (to - from) + from)
    end

    100.times do
      student = Student.offset(rand(Student.count)).first
      student.attended = true
      student.attended_at = rand_time(2.hours.ago..Time.zone.now)
      student.save
    end
  end

  desc "reset all students' elected flag"
  task :reset_elected => :environment do
    Student.update_all(elected: false)
    Student.update_all(elected_at: nil)
  end

  desc "reset all students' attended flag"
  task :reset_attended => :environment do
    Student.update_all(attended: false)
    Student.update_all(attended_at: nil)
  end
end
