namespace :classrooms do
  desc "reset elected classes"
  task :reset_elected => :environment do
    Classroom.update_all(elected: false)
  end
end

