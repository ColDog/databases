require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(     name: 'Example User', email: 'user@example.com', phone: '654-654-6547', age: 22,
                          health_notes: 'healthy', password: 'password', password_confirmation: 'password',
                          activated: false, admin: false, staff: false, waiver: false)
  end

  test 'should save' do
    assert User.create!({name: 'Example User', email: 'user@example.com', phone: '654-654-6547', age: 22,
                         health_notes: 'healthy', password: 'password', password_confirmation: 'password',
                         activated: false, admin: false, staff: false, waiver: false})
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '    '
    assert(!@user.save) && assert_not(@user.valid?)
  end

  test 'email should be present' do
    @user.email = '    '
    assert(!@user.save) && assert_not(@user.valid?)
  end

  test 'name should not be too long' do
    @user.name = 'a' * 51
    assert(!@user.save) && assert_not(@user.valid?)
  end

  test 'email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert(!@user.save) && assert_not(@user.valid?)
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert(@user.valid?)
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert(!@user.save) && assert_not(@user.valid?)
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'phone number should be present' do
    @user.phone = ' '
    assert(!@user.save) && assert_not(@user.valid?)
  end

  test 'phone number can have other characters' do
    @user.phone = '604-224-7245'
    assert(@user.save) && assert(@user.valid?)
  end

  test 'phone number should not be too long' do
    @user.phone = '1234567891011'
    assert(!@user.save) && assert_not(@user.valid?)
  end

end
