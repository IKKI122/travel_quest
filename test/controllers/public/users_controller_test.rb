require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_users_index_url
    assert_response :success
  end

  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get request_likes" do
    get public_users_request_likes_url
    assert_response :success
  end

  test "should get report_likes" do
    get public_users_report_likes_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_users_unsubscribe_url
    assert_response :success
  end
end
