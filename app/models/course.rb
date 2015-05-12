class CourseCorrectTypesValidator < ActiveModel::Validator
  def validate(record)
    unless %w"5-7 7-10 10-14 11-16 13-18 8-16 Adult".include?(record.age_group)
      record.errors[:name] << 'Wrong Age Group'
    end
    unless %w"Pirate Escape Opti Advanced".include?(record.boat)
      record.errors[:name] << 'Wrong Boat Type'
    end
    unless %w"Jericho Kitsilano".include?(record.location)
      record.errors[:name] << 'Wrong Location'
    end
    unless %w"Beginner Intermediate Advanced".include?(record.category)
      record.errors[:name] << 'Wrong Category'
    end
  end
end

class Course < ActiveRecord::Base
  has_many :class_lists

  validates :title, presence: true, length: { maximum: 244 }
  validates :category, presence: true
  validates :location, presence: true
  validates :boat, presence: true
  validates :about, presence: true, length: { maximum: 500 }
  validates :code, presence: true, length: { is: 4 }, uniqueness: true
  validates :size, presence: true, numericality: true
  validates :year, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :age_group, presence: true

  validates_with CourseCorrectTypesValidator

end