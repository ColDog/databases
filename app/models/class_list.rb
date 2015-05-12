class ClassList < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :user_id, presence: true

  validates :course_id, presence: true

end
