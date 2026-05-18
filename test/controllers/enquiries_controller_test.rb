require "test_helper"

class EnquiriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @property = properties(:one)
    @enquiry = enquiries(:one)
    @user = User.create!(email: "test@example.com", password: "password123", password_confirmation: "password123")
    ActionMailer::Base.deliveries.clear
  end

  teardown do
    @user&.destroy
  end

  # new and create are public
  test "new is accessible without login" do
    get property_new_enquiry_path(@property)
    assert_response :success
  end

  test "create with valid params creates an enquiry and redirects to property" do
    assert_difference "Enquiry.count", 1 do
      post property_enquiries_path(@property), params: { enquiry: valid_enquiry_params }
    end
    assert_redirected_to property_path(@property)
  end

  test "create sends two emails on success" do
    post property_enquiries_path(@property), params: { enquiry: valid_enquiry_params }
    assert_equal 2, ActionMailer::Base.deliveries.size
  end

  test "create with invalid params re-renders new" do
    post property_enquiries_path(@property), params: { enquiry: { first_name: "" } }
    assert_response :unprocessable_entity
  end

  test "create with invalid params does not send emails" do
    post property_enquiries_path(@property), params: { enquiry: { first_name: "" } }
    assert_empty ActionMailer::Base.deliveries
  end

  # index, show, destroy require authentication
  test "index redirects to sign-in when not logged in" do
    get property_enquiries_path(@property)
    assert_redirected_to new_user_session_path
  end

  test "show redirects to sign-in when not logged in" do
    get property_enquiry_path(@property, @enquiry)
    assert_redirected_to new_user_session_path
  end

  test "destroy redirects to sign-in when not logged in" do
    delete property_enquiry_path(@property, @enquiry)
    assert_redirected_to new_user_session_path
  end

  test "index returns success when logged in" do
    sign_in @user
    get property_enquiries_path(@property)
    assert_response :success
  end

  test "show returns success when logged in" do
    sign_in @user
    get property_enquiry_path(@property, @enquiry)
    assert_response :success
  end

  test "destroy deletes the enquiry and redirects" do
    sign_in @user
    assert_difference "Enquiry.count", -1 do
      delete property_enquiry_path(@property, @enquiry)
    end
    assert_redirected_to property_enquiries_path(property_id: @property.id)
  end

  private

  def valid_enquiry_params
    {
      first_name: "Jane",
      last_name: "Smith",
      email: "jane@example.com",
      mobile: "07700900000",
      check_in: 7.days.from_now.to_date,
      check_out: 10.days.from_now.to_date,
      guests: 2,
      with_pets: false,
      message: "Looking forward to it",
      referral: "Google"
    }
  end
end
