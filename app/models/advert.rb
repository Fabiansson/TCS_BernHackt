class Advert < ApplicationRecord
  belongs_to :seasonpass
  belongs_to :game

  belongs_to :user, foreign_key: 'sold_to_user_id', optional: true

  def self.filter(filters)
    return unless Advert.count.positive?
    adverts = Advert.where(sold_to_user_id: nil)
    adverts = adverts.all_between_dates(filters[:date]) if filters[:date] != [nil, nil]
    adverts = adverts.all_by_club_id(filters[:club_id]) if filters[:club_id]
    adverts = adverts.all_by_sport_id(filters[:sport_id]) if filters[:sport_id]
    adverts
  end

  private

  scope :all_between_dates, (lambda do |dates|
    dates[0].nil? ? DateTime.new(0) : DateTime.parse(dates[0])
    dates[1] .nil? ? DateTime::Infinity.new : DateTime.parse(dates[1])
    game_date = game.date
    where(game_date.to_sym => Range.new(*dates))
  end)

  scope :all_by_club_id, (lambda do |club_id|
    home_club = game.home_club_id
    where(home_club.to_sym => club_id)
  end)

  scope :all_by_sport_id, (lambda do |sport_id|
    sport = Sport.find(sport_id)
    club = Club.find(game.home_club_id)
    club_sport = club.sport
    where(club_sport => sport)
  end)
end
