module ClassSize

  # for class list model
  class ClassSizeValidator < ActiveModel::Validator

    def validate(record)
      max_size = record.course.size
      course_id = record.course_id
      current_size = Course.find(course_id).class_lists.count
      if current_size >= max_size.to_i
        record.errors[:name] << 'Class is full!'
      end
    end

  end

  # for class list model
  class UniqueClassUserValidator < ActiveModel::Validator

    def validate(record)
      user = record.user_id
      course_id = record.course_id
      unless Course.find(course_id).class_lists.find_by_user_id(user) == nil
        record.errors[:name] << "You've Already Signed Up!"
      end
    end

  end

  # for wait list model
  class WaitSizeValidator < ActiveModel::Validator

    def validate(record)
      max_size = record.course.size
      course_id = record.course_id
      current_size = Course.find(course_id).wait_lists.count
      if current_size >= max_size.to_i
        record.errors[:name] << 'Class is full!'
      end
    end

  end

  # for wait list model
  class UniqueWaitUserValidator < ActiveModel::Validator

    def validate(record)
      user = record.user_id
      course_id = record.course_id
      unless Course.find(course_id).wait_lists.find_by_user_id(user) == nil
        record.errors[:name] << "You've Already Signed Up!"
      end
    end

  end

  # for wait list model
  class WaitListOnlyIfFull < ActiveModel::Validator

    def validate(record)
      max_size = record.course.size
      current_size = Course.find(record.course_id).class_lists.count
      if current_size < max_size.to_i
        record.errors[:size] << 'Class is not yet full!'
      end
    end

  end

end