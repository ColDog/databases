class ClassSizeValidator < ActiveModel::Validator
  def validate(record)
    max_size = record.course.size
    course_id = record.course_id
    current_size = Course.find(course_id).class_lists.count
    if current_size > max_size.to_i - 1
      record.errors[:name] << 'Class is full!'
    end
  end
end

class UniqueClassUserValidator < ActiveModel::Validator
  def validate(record)
    user = record.user_id
    course_id = record.course_id
    unless Course.find(course_id).class_lists.find_by_user_id(user) == nil
      record.errors[:name] << "You've Already Signed Up!"
    end
  end
end

class ClassList < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates_with ClassSizeValidator

  validates_with UniqueClassUserValidator, on: [:create]

  validates :user_id, presence: true

  validates :course_id, presence: true

end