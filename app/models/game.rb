class Game < ApplicationRecord
  has_many :club
  has_many :adverts

  def name
    "#{home_club.name} : #{away_club.name}"
  end

  def home_club
    Club.find_by(id: home_club_id)
  end

  def away_club
    Club.find_by(id: away_club_id)
  end
end
