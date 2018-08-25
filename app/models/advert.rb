class Advert < ApplicationRecord
  belongs_to :seasonpass
  belongs_to :game
  belongs_to :user, foreign_key: 'sold_to_user_id', optional: true
end
