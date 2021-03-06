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

ActiveRecord::Schema.define(version: 2020_11_26_060910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boss_check_comments", force: :cascade do |t|
    t.bigint "detail_report_id"
    t.boolean "confirmation"
    t.date "confirmation_date", null: false
    t.text "positive_comment", null: false
    t.text "negative_comment", null: false
    t.text "assistance", null: false
    t.text "questions", null: false
    t.text "report_to_sales", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detail_report_id"], name: "index_boss_check_comments_on_detail_report_id"
  end

  create_table "compornents", force: :cascade do |t|
    t.integer "product_id"
    t.integer "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.index ["customer_number"], name: "index_customers_on_customer_number", unique: true
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "detail_reports", force: :cascade do |t|
    t.bigint "support_program_id"
    t.date "ordered_date", null: false
    t.bigint "ordered_price", null: false
    t.date "actual_kickoff_date", null: false
    t.date "actual_complete_date", null: false
    t.text "service_detail", null: false
    t.text "photo"
    t.text "results", null: false
    t.integer "evaluation", null: false
    t.text "evaluation_details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["support_program_id"], name: "index_detail_reports_on_support_program_id"
  end

  create_table "installed_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "customer_id"
    t.string "serial_number", limit: 8, null: false
    t.date "installed_date", null: false
    t.bigint "discount_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_installed_products_on_customer_id"
    t.index ["product_id"], name: "index_installed_products_on_product_id"
  end

  create_table "installs", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "installed_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.bigint "detail_report_id"
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
    t.index ["detail_report_id"], name: "index_parts_on_detail_report_id"
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

  create_table "sales_check_comments", force: :cascade do |t|
    t.bigint "boss_check_comment_id"
    t.boolean "confirmation"
    t.date "confirmation_date", null: false
    t.text "comments", null: false
    t.boolean "discussion_possibility"
    t.boolean "matter_closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boss_check_comment_id"], name: "index_sales_check_comments_on_boss_check_comment_id"
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
    t.index ["title_number"], name: "index_support_programs_on_title_number", unique: true
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
    t.integer "position", default: 2, null: false
    t.boolean "permission", default: false, null: false
    t.string "cellphone_number", limit: 16
    t.integer "stay_or_left", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_number"], name: "index_users_on_employee_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boss_check_comments", "detail_reports"
  add_foreign_key "customers", "users"
  add_foreign_key "detail_reports", "support_programs"
  add_foreign_key "installed_products", "customers"
  add_foreign_key "installed_products", "products"
  add_foreign_key "parts", "detail_reports"
  add_foreign_key "sales_check_comments", "boss_check_comments"
  add_foreign_key "support_programs", "customers"
  add_foreign_key "support_programs", "users"
end
