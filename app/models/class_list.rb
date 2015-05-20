class ClassList < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :user_id,   presence: true
  validates :course_id, presence: true

  include ReferentialIntegrity
  validates_with CourseAndUserExist,       if: :no_errors

  include ClassSize
  validates_with ClassSizeValidator,       if: :no_errors
  validates_with UniqueClassUserValidator, if: :no_errors, on: [:create]

  after_destroy :add_wait_listed_users

  private
  def add_wait_listed_users
    if (self.course.class_lists.count < self.course.size) && (self.course.wait_lists.count >= 1)
      ClassList.create(course_id: self.course.id, user_id: self.course.wait_lists.first.user.id) # TODO first might not be first in line
      WaitList.first.destroy
    end
  end

  def no_errors
    errors.empty?
  end

end