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

ActiveRecord::Schema.define(version: 20141125070403) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "branches", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["company_id"], name: "index_branches_on_company_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chase_points", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "redeemed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chase_points", ["user_id"], name: "index_chase_points_on_user_id"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "submitted_by_id"
    t.string   "status"
    t.integer  "assigned_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "branch_id"
    t.integer  "product_id"
    t.boolean  "verified"
    t.decimal  "value"
    t.integer  "verified_by_id"
  end

  add_index "leads", ["assigned_to_id"], name: "index_leads_on_assigned_to_id"
  add_index "leads", ["branch_id"], name: "index_leads_on_branch_id"
  add_index "leads", ["product_id"], name: "index_leads_on_product_id"
  add_index "leads", ["submitted_by_id"], name: "index_leads_on_submitted_by_id"
  add_index "leads", ["verified_by_id"], name: "index_leads_on_verified_by_id"

  create_table "notes", force: true do |t|
    t.text     "message"
    t.integer  "lead_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["lead_id"], name: "index_notes_on_lead_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_uid"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.boolean  "active",      default: true
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "employeeID"
    t.string   "email"
    t.string   "phone_number"
    t.string   "role_id"
    t.boolean  "backend_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.integer  "company_id"
    t.string   "department"
    t.boolean  "setup"
    t.string   "name"
    t.string   "image_uid"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"

end
