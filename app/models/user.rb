class User < ActiveRecord::Base
  has_many :class_lists

  before_save { self.email = email.downcase }
  before_save { self.phone = phone.strip }

  validates :name,
            presence: true,
            length: { maximum: 50 }

  validates :phone,
            presence: true,
            length: { is: 10 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

end
