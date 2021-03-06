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

Sport.all.each do |sport|
  10.times do
    first_club = Club.where(sport: sport).order("Random()").first
    second_club = Club.where(sport: sport).order("Random()").first
    while first_club.eql? second_club do
      second_club = Club.where(sport: sport).order("Random()").first
    end
    Game.create(home_club_id: first_club.id, away_club_id: second_club.id, date: Faker::Time.forward(20))
  end
end

20.times do
  Advert.create(seasonpass: Seasonpass.order("RANDOM()").first, game: Game.order("RANDOM()").first, price: rand(11.2...76.9), hashcode: (0...50).map { ('a' .. 'z').to_a[rand(26)] }.join)
end