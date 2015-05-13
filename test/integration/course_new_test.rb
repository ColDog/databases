require 'test_helper'

class CourseNewTest < ActionDispatch::IntegrationTest

  def setup
    @admin      = users(:colin)
    @non_admin  = users(:non_admin)
  end

  test 'valid course submit' do
    log_in_as(@admin)

    get new_course_path

    assert_difference 'Course.count', +1 do
      post courses_path course: {
                                  code: 'AC25',
                                  boat: 'Pirate',
                                  category: 'Intermediate',
                                  size: 16,
                                  dates: 'March 20 - 25',
                                  year: 2015,
                                  price: 330,
                                  location: 'Jericho',
                                  title: 'Cansail Level 1',
                                  about: 'A Description',
                                  age_group: '10-14'}
    end
  end

  test 'invalid course submit' do
    log_in_as(@admin)

    get new_course_path

    assert_no_difference 'Course.count' do
      post courses_path course: {
                           code: '',
                           boat: 'Pirate',
                           category: 'Intermediate',
                           size: 16,
                           dates: 'March 20 - 25',
                           year: 2015,
                           price: 330,
                           location: 'Jericho',
                           title: 'Cansail Level 1',
                           about: 'A Description',
                           age_group: '10-14'}
    end
  end


end
