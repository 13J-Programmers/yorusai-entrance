require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @students = Student.all
  end

  # --- students#index ---

  test "should require authorization before get students" do
    get students_url
    assert_redirected_to login_url
  end

  test "should get students" do
    login
    get students_url
    assert_response :success
  end

  # --- students#create ---

  test "should require authorization before post students" do
    assert_no_difference -> { Student.count } do
      post students_url, params: { student: {
        student_id: "16150",
        classroom_abbr: "1-1"
        } }
    end
    assert_redirected_to login_url
    assert flash[:danger]
  end

  test "should post students to create new student" do
    login
    assert_difference -> { Student.count } do
      post students_url, params: { student: {
        student_id: "16150",
        classroom_abbr: "1-1"
        } }
    end
    assert flash[:success]
  end

  test "should reject post students when invalid classroom_abbr" do
    login
    assert_no_difference -> { Student.count } do
      post students_url, params: { student: {
        student_id: "16151",
        classroom_abbr: "1-7"
        } }
      post students_url, params: { student: {
        student_id: "16152",
        classroom_abbr: "2E"
        } }
    end
    assert flash[:danger]
  end

  # --- students#new ---

  test "should require authorization before get new_student" do
    get new_student_url
    assert_redirected_to login_url
  end

  test "should get new_student" do
    login
    get new_student_url
    assert_response :success
  end

  # --- students#destroy ---

  test "should require authorization before delete student" do
    delete student_url(@students.first)
    assert_redirected_to login_url
  end

  test "should delete student" do
    login
    student = @students.first
    delete student_url(student), params: { student_id: student.student_id }
    assert flash[:success]
  end

  # --- students#scan ---

  test "should require authorization before get scan" do
    get students_scan_url
    assert_redirected_to login_url
  end

  test "should get scan" do
    login
    get students_scan_url
    assert_response :success
  end

  test "should attend given student" do
    login
    get students_scan_url
    assert_difference -> { Student.where(attended: true).count }, 2 do
      post students_scan_url, params: { student: { student_id: 16101 } }
      post students_scan_url, params: { student: { student_id: 16102 } }
    end
  end

  # --- students#update ---



  # --- students#create_from_csv ---

  test "should require authorization before post students_create_from_csv" do
    post students_create_from_csv_url
    assert_redirected_to login_url
  end

  # test "should post students_create_from_csv" do
  #   login
  #   @csv_file = fixture_file_upload('files/test.csv','text/csv')
  #   post students_create_from_csv_url, params: { file: @csv_file }
  #   assert flash[:success]
  # end

  # --- students#destroy_all ---

  test "should delete students" do
    #
  end

  # --- students#reset_elected ---

  test "should require authorization before post students_reset_elected" do
    post students_reset_elected_url
    assert_redirected_to login_url
  end

  test "should post students_reset_elected" do
    login
    post students_reset_elected_url
    assert flash[:success]
  end

  # --- students#reset_attended ---

  test "should require authorization before post students_reset_attended" do
    post students_reset_attended_url
    assert_redirected_to login_url
  end

  test "should post students_reset_attended" do
    login
    post students_reset_attended_url
    assert flash[:success]
  end

  # --- students#attend_at_random ---

  test "should require authorization before post students_attend_at_random" do
    post students_attend_at_random_url
    assert_redirected_to login_url
  end

  test "should get students_attend_at_random" do
    login
    post students_attend_at_random_url
    assert flash[:success]
  end

  # --- students#data ---

  test "should get student's json data" do
    #
  end

end
