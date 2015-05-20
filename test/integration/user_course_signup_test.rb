require 'test_helper'

class UserCourseSignupTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:colin)
    @non_admin = users(:non_admin)
    @unregistered = users(:unregistered)
    @unactivated = users(:unactivated)
    @course = courses(:cansail)
    @class_list = class_lists(:class_list_one)
    ActionMailer::Base.deliveries.clear
  end

  test 'see activate link with unactivated user' do
    log_in_as @unactivated
    get all_path
    assert_select 'a[href=?]', user_path(@unactivated), text: 'Activate Account'
  end

  test 'see login link with no user' do
    get all_path
    assert_select 'a[href=?]', login_path, text: 'Log In'
  end

  test 'follow register link with activated user' do
    log_in_as @unregistered
    get all_path
    assert_select 'a[href=?]', class_lists_path(class_list: {course_id: @course.id} ), text: 'Register'
    assert_difference 'ClassList.count', +1 do
      post class_lists_path(class_list: {course_id: @course.id, user_id: @unregistered.id} )
    end
    class_list = assigns(:class_list)
    assert_redirected_to class_list_path(class_list)
  end

  test 'try register post with unactivated user' do
    log_in_as @unactivated
    get all_path
    assert_no_difference 'ClassList.count' do
      post class_lists_path(class_list: {course_id: @course.id, user_id: @unregistered.id} )
    end
    assert_redirected_to user_path(@unactivated)
  end



end
