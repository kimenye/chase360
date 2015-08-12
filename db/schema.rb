# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150812055525) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "administrators", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true

  create_table "branches", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["company_id"], name: "index_branches_on_company_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chase_points", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action",     limit: 255
    t.integer  "amount"
    t.boolean  "redeemed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chase_points", ["user_id"], name: "index_chase_points_on_user_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.string   "image_uid",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["company_id"], name: "index_departments_on_company_id"

  create_table "leads", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "phone_number",    limit: 255
    t.integer  "submitted_by_id"
    t.string   "status",          limit: 255
    t.integer  "assigned_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "branch_id"
    t.integer  "product_id"
    t.boolean  "verified"
    t.decimal  "value"
    t.integer  "verified_by_id"
    t.text     "note"
  end

  add_index "leads", ["assigned_to_id"], name: "index_leads_on_assigned_to_id"
  add_index "leads", ["branch_id"], name: "index_leads_on_branch_id"
  add_index "leads", ["product_id"], name: "index_leads_on_product_id"
  add_index "leads", ["submitted_by_id"], name: "index_leads_on_submitted_by_id"
  add_index "leads", ["verified_by_id"], name: "index_leads_on_verified_by_id"

  create_table "notes", force: :cascade do |t|
    t.text     "message"
    t.integer  "lead_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["lead_id"], name: "index_notes_on_lead_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.string   "image_uid",   limit: 255
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.boolean  "active",                  default: true
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "employeeID",    limit: 255
    t.string   "email",         limit: 255
    t.string   "phone_number",  limit: 255
    t.string   "role_id",       limit: 255
    t.boolean  "backend_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",      limit: 255
    t.string   "uid",           limit: 255
    t.integer  "company_id"
    t.boolean  "setup"
    t.string   "name",          limit: 255
    t.string   "image_uid",     limit: 255
    t.integer  "department_id"
    t.integer  "branch_id"
  end

  add_index "users", ["branch_id"], name: "index_users_on_branch_id"
  add_index "users", ["company_id"], name: "index_users_on_company_id"
  add_index "users", ["department_id"], name: "index_users_on_department_id"

end
