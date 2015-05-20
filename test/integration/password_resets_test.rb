require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:non_admin)
  end

  test 'password resets' do
    get new_password_reset_path
    assert_template 'password_resets/new'

    post password_resets_path, password_reset: { email: '   ' }       # test invalid email
    assert_not @user.reset_digest
    assert_template 'password_resets/new'

    post password_resets_path, password_reset: { email: @user.email } # test valid email
    assert_equal 1, ActionMailer::Base.deliveries.size

    assert_redirected_to root_url

    user = assigns(:user)
    get edit_password_reset_path(user.reset_token, email: user.email)

    patch password_reset_path(user.reset_token),
          email: user.email,
          user: { password:              "foobaz",
                  password_confirmation: "foobaz" }

  end

end
