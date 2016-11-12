require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @students = Student.all
  end

  test "should require authorization before get new_student" do
    get new_student_url
    assert_redirected_to login_url
  end

  test "should require authorization before get students" do
    get students_url
    assert_redirected_to login_url
  end

  test "should require authorization before get scan" do
    get students_scan_url
    assert_redirected_to login_url
  end

  test "should require authorization before post students_attend_at_random" do
    post students_attend_at_random_url
    assert_redirected_to login_url
  end

  test "should require authorization before post students_reset_attended" do
    post students_reset_attended_url
    assert_redirected_to login_url
  end

  test "should require authorization before post students_reset_elected" do
    post students_reset_elected_url
    assert_redirected_to login_url
  end

  test "should require authorization before post students_create_from_csv" do
    post students_create_from_csv_url
    assert_redirected_to login_url
  end

  test "should require authorization before delete student" do
    delete student_url(@students.first)
    assert_redirected_to login_url
  end
end
