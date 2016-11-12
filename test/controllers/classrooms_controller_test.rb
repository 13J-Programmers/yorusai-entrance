require 'test_helper'

class ClassroomsControllerTest < ActionDispatch::IntegrationTest
  test "should require authorization before get classrooms" do
    get classrooms_url
    assert_redirected_to login_url
  end

  test "should require authorization before post classrooms_reset_elected" do
    post classrooms_reset_elected_url
    assert_redirected_to login_url
  end
end
