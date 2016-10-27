namespace :admins do
  desc "add default admin"
  task :add_admin => :environment do
    Admin.create(name: "admin", email: "admin@admin.com", password: "foobar", password_confirmation: "foobar")
  end
end
