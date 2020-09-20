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

ActiveRecord::Schema.define(version: 2020_09_20_021245) do

  create_table "cats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "c_name", null: false
    t.text "c_text", null: false
    t.integer "price"
    t.integer "breed_id"
    t.integer "ope_id", null: false
    t.integer "sex_id", null: false
    t.integer "age_id", null: false
    t.integer "hair_length_id"
    t.integer "color_id"
    t.integer "how_many_id"
    t.integer "eye_color_id"
    t.integer "character_id", null: false
    t.integer "fleas_id", null: false
    t.integer "veccine_id", null: false
    t.integer "kuchu_id", null: false
    t.integer "single_id"
    t.integer "senior_id"
    t.bigint "trader_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trader_id"], name: "index_cats_on_trader_id"
  end

  create_table "personals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_personals_on_email", unique: true
    t.index ["reset_password_token"], name: "index_personals_on_reset_password_token", unique: true
  end

  create_table "traders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "t_name", null: false
    t.string "t_postal_code", null: false
    t.integer "area_id", null: false
    t.string "t_city", null: false
    t.string "t_address_num", null: false
    t.string "t_building_num"
    t.string "t_tel", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_traders_on_email", unique: true
    t.index ["reset_password_token"], name: "index_traders_on_reset_password_token", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
