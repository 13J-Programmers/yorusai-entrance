require 'test_helper'

class AdminsLoginTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:admin)
  end

  test "should reject invalid signin" do
    get login_url
    post login_path, params: {
      session: { name: "", password: "foo", password_confirmation: "bar" }
    }
    assert flash[:danger]
    assert_not redirect?
  end

  test "should accept valid signin" do
    https!
    get login_url
    post login_path, params: {
      session: { name: "admin", password: "password", password_confirmation: "password" }
    }
    assert_not flash[:danger]
    assert redirect?
  end
end
