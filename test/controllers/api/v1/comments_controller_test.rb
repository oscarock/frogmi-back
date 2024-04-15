require "test_helper"

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_comments_create_url
    assert_response :success
  end
end
