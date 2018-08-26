class Seasonpass < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :club
  has_many :adverts
end
