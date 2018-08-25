class Game < ApplicationRecord
  has_many :club
  has_many :adverts
end
