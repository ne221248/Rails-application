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

ActiveRecord::Schema[7.0].define(version: 2023_12_22_064836) do
  create_table "carts", force: :cascade do |t|
    t.integer "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_carts_on_member_id"
  end

  create_table "configurations", force: :cascade do |t|
    t.integer "plan_id", null: false
    t.integer "part_id", null: false
    t.integer "cart_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_configurations_on_cart_id"
    t.index ["order_id"], name: "index_configurations_on_order_id"
    t.index ["part_id"], name: "index_configurations_on_part_id"
    t.index ["plan_id"], name: "index_configurations_on_plan_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.string "mail"
    t.string "address"
    t.string "telephone"
    t.string "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "status", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_orders_on_member_id"
  end

  create_table "part_plans", force: :cascade do |t|
    t.integer "part_id", null: false
    t.integer "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_part_plans_on_part_id"
    t.index ["plan_id"], name: "index_part_plans_on_plan_id"
  end

  create_table "part_types", force: :cascade do |t|
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.integer "part_type_id", null: false
    t.string "name", null: false
    t.integer "price", null: false
    t.string "group"
    t.integer "inventory", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_type_id"], name: "index_parts_on_part_type_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "usertype", null: false
    t.string "price", null: false
    t.boolean "sale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
