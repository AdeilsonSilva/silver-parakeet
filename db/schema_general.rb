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

ActiveRecord::Schema.define(version: 0) do

  create_table "accessories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "description", limit: 45, null: false
    t.index ["id"], name: "id_UNIQUE", unique: true
  end

  create_table "ammunition", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "caliber", limit: 45, null: false
    t.string "description", limit: 45, null: false
    t.index ["id"], name: "id_UNIQUE", unique: true
  end

  create_table "armaments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "serial_number", null: false
    t.string "manufacturer", limit: 45, null: false
    t.index ["id"], name: "id_UNIQUE", unique: true
  end

  create_table "loans", primary_key: ["id", "soldier_id", "material_reserve_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id", null: false
    t.integer "soldier_id", null: false
    t.integer "material_reserve_id", null: false
    t.integer "ammunition_id"
    t.integer "armaments_id"
    t.integer "accessories_id"
    t.integer "ammunition_amount"
    t.integer "armaments_amount"
    t.integer "accessories_amount"
    t.datetime "date", null: false
    t.index ["accessories_id"], name: "fk_loans_material_reserve_has_accessories1_idx"
    t.index ["armaments_id"], name: "fk_loans_armaments_has_material_reserve1_idx"
    t.index ["material_reserve_id", "ammunition_id"], name: "fk_loans_material_reserve_has_ammunition1_idx"
    t.index ["soldier_id"], name: "fk_loans_soldier1_idx"
  end

  create_table "material_reserve", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "reserve_id", null: false
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["reserve_id"], name: "fk_reserves_reserve1_idx"
  end

  create_table "material_reserve_has_accessories", primary_key: ["material_reserve_id", "accessories_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "material_reserve_id", null: false
    t.integer "accessories_id", null: false
    t.integer "amount", null: false
    t.index ["accessories_id"], name: "fk_material_reserve_has_accessories_accessories1_idx"
    t.index ["material_reserve_id"], name: "fk_material_reserve_has_accessories_material_reserve1_idx"
  end

  create_table "material_reserve_has_ammunition", primary_key: ["material_reserve_id", "ammunition_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "material_reserve_id", null: false
    t.integer "ammunition_id", null: false
    t.integer "amount", null: false
    t.index ["ammunition_id"], name: "fk_material_reserve_has_ammunition_ammunition1_idx"
    t.index ["material_reserve_id"], name: "fk_material_reserve_has_ammunition_material_reserve1_idx"
  end

  create_table "material_reserve_has_armaments", primary_key: ["armaments_id", "material_reserve_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "armaments_id", null: false
    t.integer "material_reserve_id", null: false
    t.integer "amount", null: false
    t.index ["armaments_id"], name: "fk_armaments_has_material_reserve_armaments1_idx"
    t.index ["material_reserve_id"], name: "fk_armaments_has_material_reserve_material_reserve1_idx"
  end

  create_table "reserves", primary_key: ["id", "material_reserve_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id", null: false
    t.string "initials", limit: 15, null: false
    t.string "description", null: false
    t.index ["id"], name: "id_UNIQUE", unique: true
  end

  create_table "soldiers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "graduation", limit: 45, null: false
    t.string "war_name", limit: 45, null: false
    t.integer "user_id", null: false
    t.integer "reserve_id", null: false
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["user_id"], name: "fk_soldiers_user_idx"
    t.index ["reserve_id"], name: "fk_soldiers_reserve_idx"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", limit: 45, null: false
    t.string "login", limit: 45, null: false
    t.string "name", limit: 45, null: false
    t.string "password", limit: 45, null: false
    t.index ["email"], name: "email_UNIQUE", unique: true
    t.index ["login"], name: "login_UNIQUE", unique: true
  end

  add_foreign_key "loans", "material_reserve_has_accessories", column: "accessories_id", primary_key: "accessories_id", name: "fk_loans_material_reserve_has_accessories1"
  add_foreign_key "loans", "material_reserve_has_ammunition", column: "ammunition_id", primary_key: "ammunition_id", name: "fk_loans_material_reserve_has_ammunition1"
  add_foreign_key "loans", "material_reserve_has_ammunition", column: "material_reserve_id", primary_key: "material_reserve_id", name: "fk_loans_material_reserve_has_ammunition1"
  add_foreign_key "loans", "material_reserve_has_armaments", column: "armaments_id", primary_key: "armaments_id", name: "fk_loans_armaments_has_material_reserve1"
  add_foreign_key "loans", "soldiers", name: "fk_loans_soldier1"
  add_foreign_key "material_reserve_has_accessories", "accessories", column: "accessories_id", name: "fk_material_reserve_has_accessories_accessories1"
  add_foreign_key "material_reserve_has_accessories", "material_reserve", name: "fk_material_reserve_has_accessories_material_reserve1"
  add_foreign_key "material_reserve_has_ammunition", "ammunition", name: "fk_material_reserve_has_ammunition_ammunition1"
  add_foreign_key "material_reserve_has_ammunition", "material_reserve", name: "fk_material_reserve_has_ammunition_material_reserve1"
  add_foreign_key "material_reserve_has_armaments", "armaments", column: "armaments_id", name: "fk_armaments_has_material_reserve_armaments1"
  add_foreign_key "material_reserve_has_armaments", "material_reserve", name: "fk_armaments_has_material_reserve_material_reserve1"
  add_foreign_key "reserves", "material_reserve", name: "fk_reserves_material_reserve1"
  add_foreign_key "soldiers", "users", name: "fk_soldiers_user"
end
