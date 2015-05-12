class Course < ActiveRecord::Base
  has_many :class_lists

  validates :title, presence: true, length: { maximum: 244 }

  validates :category, presence: true, if: "category == 'beginner' || category == 'intermediate' || category == 'advanced'"

  validates :location, presence: true
  
  validates :boat, presence: true
  
  validates :about, presence: true, length: { maximum: 500 }
  
  validates :code, presence: true, length: { is: 4 }, uniqueness: true
  
  validates :size, presence: true, numericality: true
  
  validates :year, presence: true, numericality: true
  
  validates :price, presence: true, numericality: true

end