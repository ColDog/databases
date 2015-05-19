class Course < ActiveRecord::Base
  has_many :class_lists, dependent: :destroy
  has_many :wait_lists,  dependent: :destroy

  validates :title,       presence: true, length: { maximum: 244 }
  validates :category,    presence: true
  validates :location,    presence: true
  validates :boat,        presence: true
  validates :about,       presence: true, length: { maximum: 500 }
  validates :code,        presence: true, length: { is: 4 }, uniqueness: true
  validates :size,        presence: true, numericality: true
  validates :year,        presence: true, numericality: true
  validates :price,       presence: true, numericality: true, length: { maximum: 4 }
  validates :age_group,   presence: true
  validates :start_date,  presence: true ; validate :start_date_is_date ; validate :start_not_in_past
  validates :end_date,    presence: true ; validate :end_date_is_date   ; validate :end_date_not_before_start

  include CorrectTypes
  validates_with CourseCorrectTypesValidator

  # scope searches and filters
  scope :search,    -> (search)     { where('code like ? OR title like ?',"#{search}%", "#{search}%") }
  scope :location,  -> (location)   { where location: location }
  scope :category,  -> (category)   { where category: category }
  scope :boat,      -> (boat)       { where boat: boat }
  scope :age_group, -> (age_group)  { where age_group: age_group }
  scope :not_age,   -> (not_age)    { where('age_group != ?', "#{not_age}") }
  scope :start_date,-> (start_date) { where(start_date: start_date..8.months.from_now).order(:start_date)  }
  scope :end_date,  -> (end_date)   { where(end_date: 8.months.ago..end_date).order(:end_date)  }

  # controller methods
  def self.adult
    self.where('age_group = ?', 'Adult')
  end

  def self.youth
    self.where('age_group != ?', 'Adult')
  end

  # validation methods
  def start_date_is_date
    unless start_date.class == Date
      errors.add(:start_date, 'Start date is not of type date')
    end
  end

  def end_date_is_date
    unless end_date.class == Date
      errors.add(:end_date, 'End date is not of type date')
    end
  end

  def start_not_in_past
    if start_date < Date.today
      errors.add(:start_date, 'Start date cannot be in the past')
    end
  end

  def end_date_not_before_start
    if end_date < start_date
      errors.add(:end_date, 'End date should be after the start date')
    end
  end

end
