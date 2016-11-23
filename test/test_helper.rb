ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login(name: "admin", password: "password")
    https!
    get login_url
    post login_path, params: {
      session: { name: name, password: password, password_confirmation: password }
    }
    follow_redirect!
  end
end
