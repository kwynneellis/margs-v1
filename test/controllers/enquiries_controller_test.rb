require "test_helper"

class EnquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get enquiries_new_url
    assert_response :success
  end
end
