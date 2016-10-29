namespace :students do
  desc "drop students table"
  task :drop => :environment do
    Student.destroy_all
  end
end
