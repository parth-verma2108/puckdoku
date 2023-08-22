# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_18_080254) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coordinates", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "dimension", default: [], array: true
    t.bigint "nba_player_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_coordinates_on_game_id"
    t.index ["nba_player_id"], name: "index_coordinates_on_nba_player_id"
    t.index ["user_id"], name: "index_coordinates_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.time "begin"
    t.time "end"
    t.boolean "expired", default: false
    t.boolean "unlimited", default: false
    t.integer "shots", default: 9
    t.integer "shots_played"
    t.datetime "played_on"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "nba_players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "from"
    t.date "to"
    t.integer "stats"
    t.string "avatar"
    t.bigint "nba_team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nba_team_id"], name: "index_nba_players_on_nba_team_id"
  end

  create_table "nba_teams", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "coordinates", "games"
  add_foreign_key "coordinates", "nba_players"
  add_foreign_key "coordinates", "users"
  add_foreign_key "games", "users"
  add_foreign_key "nba_players", "nba_teams"
end
