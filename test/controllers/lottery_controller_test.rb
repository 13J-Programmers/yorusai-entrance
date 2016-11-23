require 'test_helper'

class LotteryControllerTest < ActionDispatch::IntegrationTest
  test "should require authorization before get lottery" do
    get lottery_url
    assert_redirected_to login_url
  end

  test "should get lottery" do
    login
    get lottery_url
    assert_response :success
  end

  test "should require authorization before get lottery_classroom" do
    get lottery_classroom_url
    assert_redirected_to login_url
  end

  test "should get lottery_classroom" do
    login
    get lottery_classroom_url
    assert_response :success
  end

  test "should require authorization before get lottery_result" do
    get lottery_result_url
    assert_redirected_to login_url
  end

  test "should get lottery_result" do
    login
    get lottery_result_url
    assert_response :success
  end
end
