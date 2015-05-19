class WaitList < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :user_id,   presence: true
  validates :course_id, presence: true
  include ClassSize
  include ReferentialIntegrity
  validates_with CourseAndUserExist
  validates_with WaitListOnlyIfFull

end
