require 'test_helper'

class ShoppingTripsControllerTest < ActionController::TestCase
  setup do
    @shopping_trip = shopping_trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopping_trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopping_trip" do
    assert_difference('ShoppingTrip.count') do
      post :create, shopping_trip: { date: @shopping_trip.date, name: @shopping_trip.name, total: @shopping_trip.total, user_id: @shopping_trip.user_id, vendor_id: @shopping_trip.vendor_id }
    end

    assert_redirected_to shopping_trip_path(assigns(:shopping_trip))
  end

  test "should show shopping_trip" do
    get :show, id: @shopping_trip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopping_trip
    assert_response :success
  end

  test "should update shopping_trip" do
    patch :update, id: @shopping_trip, shopping_trip: { date: @shopping_trip.date, name: @shopping_trip.name, total: @shopping_trip.total, user_id: @shopping_trip.user_id, vendor_id: @shopping_trip.vendor_id }
    assert_redirected_to shopping_trip_path(assigns(:shopping_trip))
  end

  test "should destroy shopping_trip" do
    assert_difference('ShoppingTrip.count', -1) do
      delete :destroy, id: @shopping_trip
    end

    assert_redirected_to shopping_trips_path
  end
end
