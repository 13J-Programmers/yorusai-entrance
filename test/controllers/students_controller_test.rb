require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should require authorization before get index" do
    get students_url
    assert_redirected_to login_url
  end

  test "should require authorization before get scan" do
    get students_scan_url
    assert_redirected_to login_url
  end

end
