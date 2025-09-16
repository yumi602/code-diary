require "test_helper"

class WalkRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get walk_records_new_url
    assert_response :success
  end

  test "should get create" do
    get walk_records_create_url
    assert_response :success
  end

  test "should get index" do
    get walk_records_index_url
    assert_response :success
  end
end
