class Seasonpass < ApplicationRecord
  belongs_to :user
  belongs_to :club
  has_many :adverts
end
