require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'invalid signup information' do
    get login_path

    assert_no_difference 'User.count' do
      post users_path, user: { name: '',
                               email: 'email@invalid',
                               password: '',
                               password_confirmation: 'different'}
    end
    assert_template 'users/new'
  end

  test 'valid signup information with account activation' do
    get login_path

    # valid user sign up
    assert_difference 'User.count', 1 do
      post users_path, user: { name:                  'Example User',
                               email:                 'user@example.com',
                               phone:                  '6042247245',
                               password:              'password',
                               password_confirmation: 'password' }
    end

    # does it send mail?
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?

    # log in before activation is ok
    log_in_as(user)
    assert logged_in?

    # Invalid activation token
    get edit_account_activation_path('invalid token')
    assert_not user.activated?

    # Valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not user.activated?

    # Valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert user.activated?
  end
end
