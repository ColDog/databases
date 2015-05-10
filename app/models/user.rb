class User < ActiveRecord::Base
  has_many :class_lists

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
