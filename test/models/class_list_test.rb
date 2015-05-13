require 'test_helper'

class ClassListTest < ActiveSupport::TestCase
  def setup
    @user = users(:colin)
    @course = courses(:one)
    @class = ClassList.new(course_id: @course.id, user_id: @user.id)
  end

  test 'class should be valid' do
    assert @class.valid? && assert(@class.save)
  end

  test 'user_id should be present' do
    @class.user_id = nil
    assert(!@class.save) && assert_not(@class.valid?)
  end

  test 'course_id should be present' do
    @class.course_id = nil
    assert(!@class.save) && assert_not(@class.valid?)
  end

  test 'paid as true is valid' do
    @class.paid = true
    assert(@class.valid?)
  end



end
