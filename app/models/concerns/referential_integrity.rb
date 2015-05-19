module ReferentialIntegrity

  class CourseAndUserExist < ActiveModel::Validator
    def validate(record)
      unless Course.exists?(record.course_id)
        record.errors[:course_id] << 'Course does not exist'
      end
      unless User.exists?(record.user_id)
        record.errors[:user_id] << 'User does not exist'
      end
    end
  end

end