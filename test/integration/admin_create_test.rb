require 'test_helper'

class AdminCreateTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:colin)
    @non_admin = users(:non_admin)
    @course = courses(:cansail)
    @class_list = class_lists(:class_list_one)
    ActionMailer::Base.deliveries.clear
  end

  test 'admin create valid user' do
    log_in_as @admin
    assert_difference 'User.count', +1 do
      post admin_user_url, user: { name: 'Example User', email: 'user@example.com',
                                    phone: '6042247245', password: 'password',
                                    password_confirmation: 'password' }
    end
    user = assigns(:user)
    assert_not user.activated                            # creates unactivated user
    assert_equal 2, ActionMailer::Base.deliveries.size   # sends a password reset link
  end

  test 'admin fail to create INvalid user' do
    log_in_as @admin
    assert_no_difference 'User.count' do
      post admin_user_url, user: { name: 'Example User', email: 'user@example.com',
                                   phone: '604', password: 'password',
                                   password_confirmation: 'password23' }
    end
    user = assigns(:user)
    assert_not user.activated
    assert_equal 0, ActionMailer::Base.deliveries.size
  end

  test 'admin add valid user to course' do
    log_in_as @admin
    assert_difference 'ClassList.count', +1 do
      post admin_class_path, class_list: { course_id: @course.id, user_id: @admin.id }
    end
  end

  test 'admin fail to add INvalid user to course' do
    log_in_as @admin
    assert_no_difference 'ClassList.count' do
      post admin_class_path, class_list: { course_id: 50, user_id: 50 }
    end
  end

end
