require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Test User', email: 'test@test.com', password: 'test', password_confirmation: 'test')
  end

  test 'valid save' do
    assert @user.valid?
  end

end
