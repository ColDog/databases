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
      post courses_path course: {code: 'AC25', boat: 'Pirate', category: 'Intermediate', size: 16,
                                 dates: 'March 20 - 25', year: 2015, price: 330, location: 'Jericho',
                                 title: 'Cansail Level 1', about: 'A Description', age_group: '10-14'}
    end
    assert_redirected_to login_url
  end




end
