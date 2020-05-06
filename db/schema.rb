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

ActiveRecord::Schema.define(version: 2020_05_04_120708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "global_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["global_id"], name: "index_products_on_global_id", unique: true
  end

  create_table "shopping_list_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shopping_list_items", force: :cascade do |t|
    t.integer "qty_to_buy"
    t.boolean "bought", default: false
    t.bigint "store_product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shopping_list_id", null: false
    t.index ["shopping_list_id"], name: "index_shopping_list_items_on_shopping_list_id"
    t.index ["store_product_id"], name: "index_shopping_list_items_on_store_product_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "shopping_list_category_id"
    t.index ["shopping_list_category_id"], name: "index_shopping_lists_on_shopping_list_category_id"
    t.index ["user_id"], name: "index_shopping_lists_on_user_id"
  end

  create_table "store_products", force: :cascade do |t|
    t.integer "available_qty", default: 0, null: false
    t.string "store_prod_id", null: false
    t.decimal "price"
    t.bigint "product_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_store_products_on_product_id"
    t.index ["store_id"], name: "index_store_products_on_store_id"
    t.index ["store_prod_id"], name: "index_store_products_on_store_prod_id", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.string "city"
    t.string "country"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "shopping_list_items", "shopping_lists"
  add_foreign_key "shopping_list_items", "store_products"
  add_foreign_key "shopping_lists", "shopping_list_categories"
  add_foreign_key "shopping_lists", "users"
  add_foreign_key "store_products", "products"
  add_foreign_key "store_products", "stores"
end
