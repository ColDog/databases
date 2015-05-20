require 'test_helper'
require 'rails/performance_test_help'

class SubmitsTest < ActionDispatch::PerformanceTest

  def setup
    @admin = users(:colin)
  end

  test 'admin create valid user' do
    log_in_as @admin
    post admin_user_path, user: { name: 'Example User', email: 'user@example.com',
                                  phone: '6042247245', password: 'password',
                                  password_confirmation: 'password' }
  end

  test 'admin create INvalid user' do
    log_in_as @admin
    post admin_user_path, user: { name: ' ', email: 'user@example.com',
                                  phone: ' ', password: ' ',
                                  password_confirmation: ' ' }
  end

  test 'user signup' do
    post users_path, user: { name:                  'Example User',
                             email:                 'user@example.com',
                             phone:                  '6042247245',
                             password:              'password',
                             password_confirmation: 'password' }
  end

  # test crashes the test suite. Bug?
  # test 'course create' do
  #   log_in_as @admin
  #   post courses_path course: { code: '', boat: 'Pirate', category: 'Intermediate', size: 16,
  #                               dates: 'March 20 - 25', year: 2015, price: 330, location: 'Jericho',
  #                               title: 'Cansail Level 1', about: 'A Description', age_group: '10-14',
  #                               start_date: Date.today, end_date: Date.tomorrow }
  # end



end
