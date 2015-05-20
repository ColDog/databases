require 'test_helper'
require 'rails/performance_test_help'

class PagesTest < ActionDispatch::PerformanceTest

  test 'all courses' do
    get '/all'
  end

  test 'home' do
    get '/'
  end

  test 'login' do
    get '/login'
  end

end
