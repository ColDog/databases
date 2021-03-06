class Course < ActiveRecord::Base
  has_many :class_lists, dependent: :destroy
  has_many :wait_lists,  dependent: :destroy

  ## todo add db view for reporting

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
  validates :start_date,  presence: true
  validates :end_date,    presence: true

  include CorrectTypes
  validates_with CourseCorrectTypesValidator, if: :no_errors

  include Dates
  validates_with DateValidator,               if: :no_errors

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


  private
    def no_errors
      errors.empty?
    end

end
