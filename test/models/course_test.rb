require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    @course = Course.new(code: 'AC21', category: 'escape', size: 16, dates: 'march 20 - 25, 9 - 12', year: 2015, price: 330, location: 'Jericho', title: 'title', about: 'a test description')
  end

  test 'course should be a valid course' do
    assert @course.valid?
  end

end