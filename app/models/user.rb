class User < ApplicationRecord
  has_many :seasonpasses
  has_many :adverts

  before_save { self.email = email.downcase }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :email, presence: true, length: { maximum: 255 }
  validates_uniqueness_of :email, :case_sensitive => false

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def can_buy_pass?
    tcs_number.present?
  end
end
