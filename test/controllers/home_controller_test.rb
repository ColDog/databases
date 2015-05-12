require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get lessons" do
    get :lessons
    assert_response :success
  end

  test "should get beginner" do
    get :beginner
    assert_response :success
  end

  test "should get intermediate" do
    get :intermediate
    assert_response :success
  end

  test "should get advanced" do
    get :advanced
    assert_response :success
  end

  test "should get groups" do
    get :groups
    assert_response :success
  end

  test "should get rentals" do
    get :rentals
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get weather" do
    get :weather
    assert_response :success
  end

end
