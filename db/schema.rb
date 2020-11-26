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

ActiveRecord::Schema.define(version: 2020_11_25_235037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "customer_number", null: false
    t.string "name", limit: 32, null: false
    t.string "phone_number", limit: 16
    t.string "profession", limit: 16, null: false
    t.string "customer_in_charge", limit: 16, null: false
    t.string "department", limit: 16, null: false
    t.string "position", limit: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "installed_products", force: :cascade do |t|
    t.bigint "product_id"
    t.string "serial_number", limit: 4, null: false
    t.date "installed_date", null: false
    t.integer "discount_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_installed_products_on_product_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "type_name", limit: 32, null: false
    t.string "category", limit: 32, null: false
    t.integer "list_price", null: false
    t.integer "stock", null: false
    t.date "release_date", null: false
    t.date "end_of_production", null: false
    t.date "end_of_service", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "type_name", limit: 32, null: false
    t.string "category", limit: 32, null: false
    t.integer "list_price", null: false
    t.date "release_date", null: false
    t.date "end_of_production", null: false
    t.date "end_of_service", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "support_programs", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "user_id"
    t.integer "title_number", null: false
    t.string "title", limit: 32, null: false
    t.text "main_work", null: false
    t.integer "planed_or_argent", null: false
    t.boolean "order_status", default: false, null: false
    t.date "kick_off_date", null: false
    t.integer "closed", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_support_programs_on_customer_id"
    t.index ["user_id"], name: "index_support_programs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "employee_number", null: false
    t.string "name", limit: 32, null: false
    t.integer "department", null: false
    t.integer "position", null: false
    t.boolean "permission", default: false, null: false
    t.string "cellphone_number", limit: 16
    t.integer "stay_or_left", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "users"
  add_foreign_key "installed_products", "products"
  add_foreign_key "support_programs", "customers"
  add_foreign_key "support_programs", "users"
end
