require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get error404" do
    get errors_error404_url
    assert_response :success
  end

end
