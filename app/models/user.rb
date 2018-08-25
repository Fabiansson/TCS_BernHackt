class User < ApplicationRecord
  has_many :seasonpasses
  has_many :adverts

  before_save { self.email = email.downcase }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :email, :case_sensitive => false

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
