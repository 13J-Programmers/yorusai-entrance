require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:admin)
  end

  test "should require authorization before get admins" do
    get admins_url
    assert_redirected_to login_url
  end

  test "should require authorization before get admin" do
    get admin_url(@admin)
    assert_redirected_to login_url
  end

  test "should require authorization before get edit_admin" do
    get edit_admin_url(@admin)
    assert_redirected_to login_url
  end

  test "should require authorization before patch admin" do
    patch admin_url(@admin)
    assert_redirected_to login_url
  end
end
