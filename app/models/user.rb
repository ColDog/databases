class User < ActiveRecord::Base
  include Authentication

  has_many :class_lists, dependent: :destroy
  has_many :wait_lists,  dependent: :destroy

  has_secure_password
  attr_accessor :remember_token, :activation_token, :reset_token


  ## MODEL VALIDATIONS ##
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,      presence: true, length: { maximum: 50 }
  validates :phone,     presence: true, length: { is: 10 }
  validates :email,     presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
  validates :password,  length: { minimum: 6 }, allow_blank: true

  ## todo add emergency contact info

  ## SEARCHES ##
  scope :search,    -> (search)   { where('lower(name) like ? OR email like ?', "#{search}%", "#{search}%") }
  scope :phone,     -> (phone)    { where(phone: phone.to_i) }


  ## CREATING AND CLEANING DATA ##
  before_save   :downcase_email
  before_create :create_activation_digest

  def phone=(value)
    if value.class != Fixnum
      self[:phone] = value.gsub(/\D/, '')
    end
  end

  private
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

end
