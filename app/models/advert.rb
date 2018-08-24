class Advert < ApplicationRecord
  belongs_to :seasonpass
  belongs_to :game
  belongs_to :user
end
