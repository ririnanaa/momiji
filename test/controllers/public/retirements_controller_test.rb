require "test_helper"

class Public::RetirementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_retirements_new_url
    assert_response :success
  end
end
