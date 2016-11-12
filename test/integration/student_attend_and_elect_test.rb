require 'test_helper'

class StudentAttendAndElectTest < ActionDispatch::IntegrationTest
  def setup
    @name = "admin"
    @password = "password"

    # login
    https!
    get login_url
    post login_path, params: {
      session: { name: @name, password: @password, password_confirmation: @password }
    }
    follow_redirect!
  end

  test "should attend given student" do
    get students_scan_url
    assert_difference -> { Student.where(attended: true).count }, 2 do
      post students_scan_url, params: { student: { student_id: 16101 } }
      post students_scan_url, params: { student: { student_id: 16102 } }
    end
  end

  test "should elect random student" do
    # first attend
    post students_scan_url, params: { student: { student_id: 16101 } }
    post students_scan_url, params: { student: { student_id: 16102 } }
    # next elect
    assert_difference -> { Student.where(attended: true, elected: true).count }, 2 do
      get lottery_student_url
      get lottery_student_url
    end
    assert_not flash[:danger]
  end

  test "should elect from attended" do
    get lottery_url
    assert_no_difference -> { Student.where(attended: true, elected: true).count } do
      get lottery_student_url
      get lottery_student_url
    end
    assert flash[:danger]
  end
end
