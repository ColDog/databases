require 'test_helper'

class GettingFixturesTest < ActionDispatch::IntegrationTest
  test 'should load fixtures' do
    user = users(:colin)
    assert(user.age == 25)
  end
end
