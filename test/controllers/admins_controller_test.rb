require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:admin)
  end

  test "should require authorization before get admins" do
    get admins_url
    assert_redirected_to login_url
  end

  test "should get admins" do
    login
    get admins_url
    assert_response :success
  end

  test "should require authorization before get admin" do
    get admin_url(@admin)
    assert_redirected_to login_url
  end

  test "should get admin" do
    login
    get admin_url(@admin)
    assert_response :success
  end

  test "should require authorization before patch admin" do
    patch admin_url(@admin)
    assert_redirected_to login_url
  end

  test "should patch admin (password update)" do
    new_password = "spam ham egg"

    login
    patch admin_url(@admin), params: {
      admin: { password: new_password, password_confirmation: new_password }
    }
    assert redirect?
    assert flash[:success]

    logout
    assert_redirected_to root_url

    login(password: new_password)
    assert redirect?
    assert flash[:success]
  end

  test "should require authorization before get edit_admin" do
    get edit_admin_url(@admin)
    assert_redirected_to login_url
  end

  test "should get edit_admin" do
    login
    get edit_admin_url(@admin)
    assert_response :success
  end
end
