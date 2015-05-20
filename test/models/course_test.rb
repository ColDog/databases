require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    @course = Course.new(code: 'AC21', boat: 'Escape', category: 'Beginner', size: 16, dates: 'march 20 - 25, 9 - 12',
                         year: 2015, price: 330, start_date: Date.today, end_date: Date.tomorrow, location: 'Jericho',
                         title: 'title', about: 'a test description', age_group: '5-7')
  end

  test 'course should be a valid course' do
    assert @course.valid?
  end

  test 'course with no code' do
    @course.code = ' '
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with wrong boat type' do
    @course.boat = 'Lightning'
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with wrong category type' do
    @course.category = 'Lightning'
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with wrong location type' do
    @course.location = 'Lightning'
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with missing size' do
    @course.size = '  '
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with non-numerical size' do
    @course.size = 'HI'
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with year as a string' do
    @course.year = 'HI'
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with year empty' do
    @course.year = ''
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with price as a string' do
    @course.price = 'HI'
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with price empty' do
    @course.price = ''
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with price too long' do
    @course.price = 123456
    assert(!@course.save) && assert_not(@course.valid?)
  end

  test 'course with empty title' do
    @course.title = ' '
    assert(!@course.save) && assert_not(@course.valid?)
  end

end