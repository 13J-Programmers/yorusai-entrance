require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get login_url
    assert_response :success
  end

  test "should delete logout" do
    # login
    https!
    get login_url
    post login_path, params: {
      session: { name: "admin", password: "password", password_confirmation: "password" }
    }
    assert_not flash[:danger]
    assert redirect?

    # logout
    delete logout_url
    assert_redirected_to root_url
  end
end
