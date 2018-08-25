class Advert < ApplicationRecord
  belongs_to :seasonpass
  belongs_to :game
  belongs_to :user, foreign_key: 'sold_to_user_id'

  def self.filter(filters)
    adverts = Adverts.all
    @adverts = @adverts.all_between_dates(filters[:date]) if filters[:date]
    if filters[:club_id]
      club = Club.find(filters[:club_id])
      @adverts = @adverts.where(game.home_club: club)
    end
    if filters[:sport_id]
      sport = Sport.find(filters[:sport_id])
      @adverts = @adverts.where(game.home_club.sport: sport)
    end
    @adverts
  end

  private

  scope: all_between_dates, lambda do |dates|
    dates[0].nil? ? DateTime.new(0) : DateTime.parse(dates[0])
    dates[1] .nil? ? DateTime::Infinity.new : DateTime.parse(dates[1])

    scope.where(game.date: Range.new(*dates))
  end
end
