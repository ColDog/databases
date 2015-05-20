class WaitList < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :user_id,   presence: true
  validates :course_id, presence: true

  include ReferentialIntegrity
  validates_with CourseAndUserExist,      if: :no_errors

  include ClassSize
  validates_with WaitListOnlyIfFull,      if: :no_errors
  validates_with WaitSizeValidator,       if: :no_errors
  validates_with UniqueWaitUserValidator, if: :no_errors

  private
    def no_errors
      errors.empty?
    end

end
