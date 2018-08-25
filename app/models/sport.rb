class Sport < ApplicationRecord
  has_many :clubs
  validates :name, uniqueness: true
end
