require 'test_helper'

class PointOfInterestsControllerTest < ActionController::TestCase
  setup do
    @point_of_interest = point_of_interests(:eiffel_tower)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:point_of_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create point_of_interest" do
    assert_difference('PointOfInterest.count') do
      post :create, point_of_interest: { default_name: 'Buckingham Palace' }
    end

    assert_redirected_to point_of_interest_path(assigns(:point_of_interest))
  end

  test "should show point_of_interest" do
    get :show, id: @point_of_interest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @point_of_interest
    assert_response :success
  end

  test "should update point_of_interest" do
    patch :update, id: @point_of_interest, point_of_interest: { rating: 5 }
    assert_redirected_to point_of_interest_path(assigns(:point_of_interest))
  end

  test "should destroy point_of_interest" do
    assert_difference('PointOfInterest.count', -1) do
      delete :destroy, id: @point_of_interest
    end

    assert_redirected_to point_of_interests_path
  end
end
