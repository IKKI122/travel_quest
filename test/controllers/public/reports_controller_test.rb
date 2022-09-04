require "test_helper"

class Public::ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_reports_index_url
    assert_response :success
  end

  test "should get new" do
    get public_reports_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_reports_edit_url
    assert_response :success
  end
end
