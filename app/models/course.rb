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

  validates :title,     presence: true, length: { maximum: 244 }
  validates :category,  presence: true
  validates :location,  presence: true
  validates :boat,      presence: true
  validates :about,     presence: true, length: { maximum: 500 }
  validates :code,      presence: true, length: { is: 4 }, uniqueness: true
  validates :size,      presence: true, numericality: true
  validates :year,      presence: true, numericality: true
  validates :price,     presence: true, numericality: true, length: { maximum: 4 }
  validates :age_group, presence: true

  validates_with CourseCorrectTypesValidator

  # scope searches and filters
  scope :search,    -> (search)   { where('code like ?',"#{search}%") }
  scope :location,  -> (location) { where location: location }
  scope :category,  -> (category) { where category: category }
  scope :boat,      -> (boat)     { where boat: boat }
  scope :age_group, -> (age_group){ where age_group: age_group }
  scope :not_age,   -> (not_age)  { where('age_group != ?', "#{not_age}") }
  scope :start_date,-> (search)   { where start_date: search }

  # controller methods
  def self.adult
    self.where('age_group = ?', 'Adult')
  end

  def self.youth
    self.where('age_group != ?', 'Adult')
  end

end