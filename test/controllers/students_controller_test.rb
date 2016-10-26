require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get students_index_url
    assert_response :success
  end

  test "should get scan" do
    get students_scan_url
    assert_response :success
  end

  test "should get enter" do
    get students_enter_url
    assert_response :success
  end

end
