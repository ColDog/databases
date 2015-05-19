class ClassList < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :user_id,   presence: true
  validates :course_id, presence: true

  include ReferentialIntegrity
  validates_with CourseAndUserExist

  include ClassSize
  validates_with ClassSizeValidator
  validates_with UniqueClassUserValidator, on: [:create]

  after_destroy :add_wait_listed_users

  private
  def add_wait_listed_users
    if (self.course.class_lists.count < self.course.size) && (self.course.wait_lists.count >= 1)
      ClassList.create(course_id: self.course.id, user_id: self.course.wait_lists.first.user.id) # TODO first might not be first in line
      WaitList.first.destroy
    end
  end

end