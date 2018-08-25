# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

i = 0

10.times do
  User.create(first_name: "User#{i}", last_name: "wyss", birth_date: "2018-08-23", email: "lajdsdfsf#{i}@sldkjfs.sldkfj", tcs_number: i.to_s, password: "lkjsdlfjdskfjlsdkfjlkds")
  i += 1
end

sports = [ "Fussball", "Eishockey"]

sports.each do | sport |
  Sport.create(name: sport)
end


clubs = [ [ "Fussball", [ "YB", "FCB", "FCL", "FCZ", "GC" ] ], [ "Eishockey", [ "EVZ", "SCB", "HCD", "Ambri" ] ] ]

clubs.each do | hash |
    sport = Sport.find_by(name: hash.first)
    hash.second.each do |club|
      Club.create(name: club, sport: sport)
    end
end


20.times do
  Seasonpass.create(user: User.order("RANDOM()").first, club: Club.order("Random()").first)
end

first_club = Club.order("Random()").first
second_club = Club.order("Random()").first
while first_club.eql? second_club do
  second_club = Club.order("Random()").first
end

20.times do
  Game.create(home_club_id: first_club.id, away_club_id: second_club.id, date: Faker::Time.forward(20))
end

20.times do
  Advert.create(seasonpass: Seasonpass.order("RANDOM()").first, game: Game.order("RANDOM()").first, price: rand(11.2...76.9), hashcode: (0...50).map { ('a' .. 'z').to_a[rand(26)] }.join)
end