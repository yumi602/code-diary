require "test_helper"

class WalkRecordsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should create" do
    assert_difference("WalkRecord.count") do
      post walk_records_url, params: {
        walk_record: {
          date: Date.today,
          note: "テストメモ"
        }
      }
    end
    assert_response :redirect
  end
end
