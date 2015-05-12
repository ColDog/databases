class Course < ActiveRecord::Base
  has_many :class_lists

  validates :title, presence: true, length: { maximum: 244 }
  validates :category, presence: true, if: "category == 'Beginner' || category == 'Intermediate' || category == 'Advanced'"
  validates :location, presence: true, if: "location == 'Jericho' || location == 'Kitsilano'"
  validates :boat, presence: true, if: "boat == 'Pirate' || boat == 'Escape' || boat == 'Opti || boat == 'Advanced'"
  validates :about, presence: true, length: { maximum: 500 }
  validates :code, presence: true, length: { is: 4 }, uniqueness: true
  validates :size, presence: true, numericality: true
  validates :year, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  # validates :start_date
  # validates :end_date
  # validates :dates
  validates :age_group, presence: true, if: "age_group ==  '5-7' || age_group == '7-10' || age_group == '10-14' || age_group == '11-16' || age_group == '13-18' || age_group == '8-16' || age_group == 'Adult'"



end