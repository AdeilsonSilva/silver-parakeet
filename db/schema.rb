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

ActiveRecord::Schema.define(version: 20170813152930) do

  create_table "accessories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ammunitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "caliber"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "armaments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "serial_number"
    t.string "manufacturer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "soldier_id"
    t.bigint "material_reserve_id"
    t.bigint "ammunition_id"
    t.bigint "armaments_id"
    t.bigint "accessories_id"
    t.integer "ammunition_amount"
    t.integer "armaments_amount"
    t.integer "accessories_amount"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessories_id"], name: "index_loans_on_accessories_id"
    t.index ["ammunition_id"], name: "index_loans_on_ammunition_id"
    t.index ["armaments_id"], name: "index_loans_on_armaments_id"
    t.index ["material_reserve_id"], name: "index_loans_on_material_reserve_id"
    t.index ["soldier_id"], name: "index_loans_on_soldier_id"
  end

  create_table "material_reserve_has_accessories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "material_reserve_id"
    t.bigint "accessories_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessories_id"], name: "index_material_reserve_has_accessories_on_accessories_id"
    t.index ["material_reserve_id"], name: "index_material_reserve_has_accessories_on_material_reserve_id"
  end

  create_table "material_reserve_has_ammunitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "material_reserve_id"
    t.bigint "ammunition_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ammunition_id"], name: "index_material_reserve_has_ammunitions_on_ammunition_id"
    t.index ["material_reserve_id"], name: "index_material_reserve_has_ammunitions_on_material_reserve_id"
  end

  create_table "material_reserve_has_armaments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "armaments_id"
    t.bigint "material_reserve_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["armaments_id"], name: "index_material_reserve_has_armaments_on_armaments_id"
    t.index ["material_reserve_id"], name: "index_material_reserve_has_armaments_on_material_reserve_id"
  end

  create_table "material_reserves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reserves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "initials"
    t.string "description"
    t.bigint "material_reserve_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_reserve_id"], name: "index_reserves_on_material_reserve_id"
  end

  create_table "soldiers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "graduation"
    t.string "war_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_soldiers_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.string "login"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "loans", "accessories", column: "accessories_id"
  add_foreign_key "loans", "ammunitions"
  add_foreign_key "loans", "armaments", column: "armaments_id"
  add_foreign_key "loans", "material_reserves", column: "material_reserve_id"
  add_foreign_key "loans", "soldiers"
  add_foreign_key "material_reserve_has_accessories", "accessories", column: "accessories_id"
  add_foreign_key "material_reserve_has_accessories", "material_reserves", column: "material_reserve_id"
  add_foreign_key "material_reserve_has_ammunitions", "ammunitions"
  add_foreign_key "material_reserve_has_ammunitions", "material_reserves", column: "material_reserve_id"
  add_foreign_key "material_reserve_has_armaments", "armaments", column: "armaments_id"
  add_foreign_key "material_reserve_has_armaments", "material_reserves", column: "material_reserve_id"
  add_foreign_key "reserves", "material_reserves", column: "material_reserve_id"
  add_foreign_key "soldiers", "users"
end
