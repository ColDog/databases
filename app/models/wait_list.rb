class WaitListOnlyIfFull < ActiveModel::Validator

  def validate(record)
    if record.course_id != nil
      max_size = record.course.size
      current_size = Course.find(record.course_id).class_lists.count
      if current_size <= max_size.to_i
        record.errors[:name] << 'Class is not yet full!'
      end
    else
      record.errors[:name] << 'No course_id!'
    end
  end

end

class WaitList < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :user_id,   presence: true
  validates :course_id, presence: true

  validates_with WaitListOnlyIfFull

end
