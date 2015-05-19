class WaitList < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :user_id,   presence: true
  validates :course_id, presence: true

  include ReferentialIntegrity
  validates_with CourseAndUserExist

  include ClassSize
  validates_with WaitListOnlyIfFull
  validates_with WaitSizeValidator
  validates_with UniqueWaitUserValidator

end
