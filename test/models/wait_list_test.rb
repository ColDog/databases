require 'test_helper'

class WaitListTest < ActiveSupport::TestCase
  def setup
    @user = users(:non_admin)
    @course = courses(:course_full)
    @wait = WaitList.new(course_id: @course.id, user_id: @user.id)
  end

  test 'user should not be able to register normally for course' do
    course = ClassList.new(course_id: @course.id, user_id: @user.id)
    assert_not course.valid?
  end

  test 'wait should be valid' do
    assert @wait.valid? && assert(@wait.save)
  end

  test 'user_id should be present' do
    @class.user_id = nil
    assert(!@wait.save) && assert_not(@wait.valid?)
  end

  test 'course_id should be present' do
    @class.course_id = nil
    assert(!@wait.save) && assert_not(@wait.valid?)
  end

  test 'user_id should be present' do
    @class.user_id = nil
    assert(!@wait.save) && assert_not(@wait.valid?)
  end

end
