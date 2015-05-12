require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get adult" do
    get :adult
    assert_response :success
  end

  test "should get youth" do
    get :youth
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

end