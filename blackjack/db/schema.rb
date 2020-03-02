# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_02_215114) do

  create_table "cards", force: :cascade do |t|
    t.string "suit"
    t.string "value"
    t.integer "deck_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id"
  end

  create_table "dealer_hand_cards", force: :cascade do |t|
    t.integer "dealer_hand_id", null: false
    t.integer "card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_dealer_hand_cards_on_card_id"
    t.index ["dealer_hand_id"], name: "index_dealer_hand_cards_on_dealer_hand_id"
  end

  create_table "dealer_hands", force: :cascade do |t|
    t.integer "dealer_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_id"], name: "index_dealer_hands_on_dealer_id"
    t.index ["game_id"], name: "index_dealer_hands_on_game_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "years_experience"
    t.string "casino"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "decks", force: :cascade do |t|
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_decks_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "min_bet"
    t.integer "max_bet"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_hand_cards", force: :cascade do |t|
    t.integer "player_hand_id", null: false
    t.integer "card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_player_hand_cards_on_card_id"
    t.index ["player_hand_id"], name: "index_player_hand_cards_on_player_hand_id"
  end

  create_table "player_hands", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_player_hands_on_game_id"
    t.index ["player_id"], name: "index_player_hands_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "bank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "decks"
  add_foreign_key "dealer_hand_cards", "cards"
  add_foreign_key "dealer_hand_cards", "dealer_hands"
  add_foreign_key "dealer_hands", "dealers"
  add_foreign_key "dealer_hands", "games"
  add_foreign_key "decks", "games"
  add_foreign_key "player_hand_cards", "cards"
  add_foreign_key "player_hand_cards", "player_hands"
  add_foreign_key "player_hands", "games"
  add_foreign_key "player_hands", "players"
end
