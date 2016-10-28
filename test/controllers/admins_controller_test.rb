require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:admin)
  end

  test "should require authorization before get index" do
    get admins_url
    assert_redirected_to login_url
  end

  test "should require authorization before get show" do
    get admin_url(@admin)
    assert_redirected_to login_url
  end

  test "should require authorization before get edit" do
    get edit_admin_url(@admin)
    assert_redirected_to login_url
  end

end
