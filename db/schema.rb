# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_25_162029) do

  create_table "adverts", force: :cascade do |t|
    t.integer "seasonpass_id"
    t.integer "game_id"
    t.integer "sold_to_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hashcode"
    t.index ["game_id"], name: "index_adverts_on_game_id"
    t.index ["seasonpass_id"], name: "index_adverts_on_seasonpass_id"
    t.index ["sold_to_user_id"], name: "index_adverts_on_sold_to_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "home_club_id"
    t.integer "away_club_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_club_id"], name: "index_games_on_away_club_id"
    t.index ["home_club_id"], name: "index_games_on_home_club_id"
  end

  create_table "seasonpasses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_seasonpasses_on_club_id"
    t.index ["user_id"], name: "index_seasonpasses_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birth_date", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "tcs_number"
  end

end
