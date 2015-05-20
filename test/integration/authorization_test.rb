require 'test_helper'

class AuthorizationTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:colin)
    @non_admin = users(:non_admin)
    @course = courses(:cansail)
    @class_list = class_lists(:class_list_one)
  end

  test 'classlist cannot create' do
    assert_no_difference 'ClassList.count' do
      post class_lists_path, class_list: { user_id: @admin.id, course_id: 1  }
    end
    assert_redirected_to login_url
  end

  test 'classlist show' do
    get class_list_path id: @non_admin
    assert_redirected_to login_url

    log_in_as(@admin)
    get class_list_path id: @class_list


  end

  test 'course cannot create' do
    assert_no_difference 'Course.count' do
      post courses_path course: { }
    end
    assert_redirected_to login_url
  end

  test 'cannot access admin pages in courses' do
    log_in_as(@non_admin)

    get courses_path
    assert_redirected_to login_url

    get course_path id: @course

  end

  test 'cannot access admin controller' do
    log_in_as(@non_admin)

    get admin_home_path
    assert_redirected_to login_url

    get admin_user_path
    assert_redirected_to login_url

    get admin_class_path
    assert_redirected_to login_url

    post admin_class_path class_list: { }
    assert_redirected_to login_url

    post admin_wait_path wait_list: { }
    assert_redirected_to login_url

    post admin_user_path user: { }
    assert_redirected_to login_url

  end


end
