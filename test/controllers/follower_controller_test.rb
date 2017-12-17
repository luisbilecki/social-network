require 'test_helper'

class FollowerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get follower_index_url
    assert_response :success
  end

end
