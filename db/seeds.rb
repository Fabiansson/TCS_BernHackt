# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


i = 0

  10.times do
    User.create(first_name: "User#{i}", last_name: "wyss", birth_date: "2018-08-23", email: "lajdsdfsf#{i}@sldkjfs.sldkfj", tcs_number: i.to_s, password: "lkjsdlfjdskfjlsdkfjlkds")
    i += 1
  end

clubs = [ { "Fussball": [ "YB", "FCB", "FCL", "FCZ", "GC" ] }, { "Eishockey": [ "EVZ", "SCB", "HCD", "Ambri" ] } ]

