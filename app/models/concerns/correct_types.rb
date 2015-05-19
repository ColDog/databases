module CorrectTypes

  class CourseCorrectTypesValidator < ActiveModel::Validator
    def validate(record)
      unless %w"5-7 7-10 10-14 11-16 13-18 8-16 Adult".include?(record.age_group)
        record.errors[:age_group] << 'Wrong Age Group'
      end
      unless %w"Pirate Escape Opti Advanced".include?(record.boat)
        record.errors[:boat] << 'Wrong Boat Type'
      end
      unless %w"Jericho Kitsilano".include?(record.location)
        record.errors[:location] << 'Wrong Location'
      end
      unless %w"Beginner Intermediate Advanced".include?(record.category)
        record.errors[:category] << 'Wrong Category'
      end
    end
  end

end