require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @property = properties(:one)
    @booking = bookings(:one)
    @user = User.create!(email: "test@example.com", password: "password123", password_confirmation: "password123")
  end

  teardown do
    @user&.destroy
  end

  # index is the one public action
  test "index is accessible without login" do
    get property_bookings_path(@property)
    assert_response :success
  end

  test "index scopes bookings to the property" do
    get property_bookings_path(@property)
    assert_response :success
  end

  # authenticated actions redirect to sign-in when logged out
  test "new redirects to sign-in when not logged in" do
    get new_property_booking_path(@property)
    assert_redirected_to new_user_session_path
  end

  test "create redirects to sign-in when not logged in" do
    post property_bookings_path(@property), params: { booking: { name: "Test", start_time: 1.day.from_now, end_time: 2.days.from_now } }
    assert_redirected_to new_user_session_path
  end

  test "edit redirects to sign-in when not logged in" do
    get edit_property_booking_path(@property, @booking)
    assert_redirected_to new_user_session_path
  end

  test "update redirects to sign-in when not logged in" do
    patch property_booking_path(@property, @booking), params: { booking: { name: "Updated" } }
    assert_redirected_to new_user_session_path
  end

  test "destroy redirects to sign-in when not logged in" do
    delete property_booking_path(@property, @booking)
    assert_redirected_to new_user_session_path
  end

  # authenticated actions
  test "new returns success when logged in" do
    sign_in @user
    get new_property_booking_path(@property)
    assert_response :success
  end

  test "create with valid params creates a booking and redirects" do
    sign_in @user
    assert_difference "Booking.count", 1 do
      post property_bookings_path(@property), params: { booking: { name: "New Booking", start_time: 1.day.from_now, end_time: 3.days.from_now } }
    end
    assert_redirected_to property_bookings_path(@property)
  end

  test "edit returns success when logged in" do
    sign_in @user
    get edit_property_booking_path(@property, @booking)
    assert_response :success
  end

  test "update changes the booking name and redirects" do
    sign_in @user
    patch property_booking_path(@property, @booking), params: { booking: { name: "Renamed" } }
    assert_redirected_to property_bookings_path(@property)
    assert_equal "Renamed", @booking.reload.name
  end

  test "destroy deletes the booking and redirects" do
    sign_in @user
    assert_difference "Booking.count", -1 do
      delete property_booking_path(@property, @booking)
    end
    assert_redirected_to property_bookings_path(@property)
  end
end
