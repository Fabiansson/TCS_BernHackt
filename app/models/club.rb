class Club < ApplicationRecord
  has_many :seasonpasses
  has_many :adverts
  belongs_to :sport
end
