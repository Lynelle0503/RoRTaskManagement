require "test_helper"

class LandingPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get root
    assert_response :success
  end
end
