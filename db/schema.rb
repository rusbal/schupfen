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

ActiveRecord::Schema.define(version: 20151212095328) do

  create_table "cama_comments", force: :cascade do |t|
    t.string   "author",         limit: 255
    t.string   "author_email",   limit: 255
    t.string   "author_url",     limit: 255
    t.string   "author_IP",      limit: 255
    t.text     "content",        limit: 65535
    t.string   "approved",       limit: 255,   default: "pending"
    t.string   "agent",          limit: 255
    t.string   "typee",          limit: 255
    t.integer  "comment_parent", limit: 4
    t.integer  "post_id",        limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "cama_comments", ["approved"], name: "index_cama_comments_on_approved", using: :btree
  add_index "cama_comments", ["comment_parent"], name: "index_cama_comments_on_comment_parent", using: :btree
  add_index "cama_comments", ["post_id"], name: "index_cama_comments_on_post_id", using: :btree
  add_index "cama_comments", ["user_id"], name: "index_cama_comments_on_user_id", using: :btree

  create_table "cama_custom_fields", force: :cascade do |t|
    t.string  "object_class", limit: 255
    t.string  "name",         limit: 255
    t.string  "slug",         limit: 255
    t.integer "objectid",     limit: 4
    t.integer "parent_id",    limit: 4
    t.integer "field_order",  limit: 4
    t.integer "count",        limit: 4,     default: 0
    t.boolean "is_repeat",                  default: false
    t.text    "description",  limit: 65535
    t.string  "status",       limit: 255
  end

  add_index "cama_custom_fields", ["object_class"], name: "index_cama_custom_fields_on_object_class", using: :btree
  add_index "cama_custom_fields", ["objectid"], name: "index_cama_custom_fields_on_objectid", using: :btree
  add_index "cama_custom_fields", ["parent_id"], name: "index_cama_custom_fields_on_parent_id", using: :btree
  add_index "cama_custom_fields", ["slug"], name: "index_cama_custom_fields_on_slug", using: :btree

  create_table "cama_custom_fields_relationships", force: :cascade do |t|
    t.integer "objectid",          limit: 4
    t.integer "custom_field_id",   limit: 4
    t.integer "term_order",        limit: 4
    t.string  "object_class",      limit: 255
    t.text    "value",             limit: 4294967295
    t.string  "custom_field_slug", limit: 255
  end

  add_index "cama_custom_fields_relationships", ["custom_field_id"], name: "index_cama_custom_fields_relationships_on_custom_field_id", using: :btree
  add_index "cama_custom_fields_relationships", ["custom_field_slug"], name: "index_cama_custom_fields_relationships_on_custom_field_slug", using: :btree
  add_index "cama_custom_fields_relationships", ["object_class"], name: "index_cama_custom_fields_relationships_on_object_class", using: :btree
  add_index "cama_custom_fields_relationships", ["objectid"], name: "index_cama_custom_fields_relationships_on_objectid", using: :btree

  create_table "cama_metas", force: :cascade do |t|
    t.string  "key",          limit: 255
    t.text    "value",        limit: 4294967295
    t.integer "objectid",     limit: 4
    t.string  "object_class", limit: 255
  end

  add_index "cama_metas", ["key"], name: "index_cama_metas_on_key", using: :btree
  add_index "cama_metas", ["object_class"], name: "index_cama_metas_on_object_class", using: :btree
  add_index "cama_metas", ["objectid"], name: "index_cama_metas_on_objectid", using: :btree

  create_table "cama_posts", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.string   "slug",             limit: 255
    t.text     "content",          limit: 4294967295
    t.text     "content_filtered", limit: 4294967295
    t.string   "status",           limit: 255,        default: "published"
    t.datetime "published_at"
    t.integer  "post_parent",      limit: 4
    t.string   "visibility",       limit: 255,        default: "public"
    t.text     "visibility_value", limit: 16777215
    t.string   "post_class",       limit: 255,        default: "Post"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "user_id",          limit: 4
    t.integer  "post_order",       limit: 4,          default: 0
    t.integer  "taxonomy_id",      limit: 4
  end

  add_index "cama_posts", ["post_class"], name: "index_cama_posts_on_post_class", using: :btree
  add_index "cama_posts", ["post_parent"], name: "index_cama_posts_on_post_parent", using: :btree
  add_index "cama_posts", ["slug"], name: "index_cama_posts_on_slug", using: :btree
  add_index "cama_posts", ["status"], name: "index_cama_posts_on_status", using: :btree
  add_index "cama_posts", ["user_id"], name: "index_cama_posts_on_user_id", using: :btree

  create_table "cama_term_relationships", force: :cascade do |t|
    t.integer "objectid",         limit: 4
    t.integer "term_order",       limit: 4
    t.integer "term_taxonomy_id", limit: 4
  end

  add_index "cama_term_relationships", ["objectid"], name: "index_cama_term_relationships_on_objectid", using: :btree
  add_index "cama_term_relationships", ["term_order"], name: "index_cama_term_relationships_on_term_order", using: :btree
  add_index "cama_term_relationships", ["term_taxonomy_id"], name: "index_cama_term_relationships_on_term_taxonomy_id", using: :btree

  create_table "cama_term_taxonomy", force: :cascade do |t|
    t.string   "taxonomy",    limit: 255
    t.text     "description", limit: 4294967295
    t.integer  "parent_id",   limit: 4
    t.integer  "count",       limit: 4
    t.string   "name",        limit: 255
    t.string   "slug",        limit: 255
    t.integer  "term_group",  limit: 4
    t.integer  "term_order",  limit: 4
    t.string   "status",      limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id",     limit: 4
  end

  add_index "cama_term_taxonomy", ["parent_id"], name: "index_cama_term_taxonomy_on_parent_id", using: :btree
  add_index "cama_term_taxonomy", ["slug"], name: "index_cama_term_taxonomy_on_slug", using: :btree
  add_index "cama_term_taxonomy", ["taxonomy"], name: "index_cama_term_taxonomy_on_taxonomy", using: :btree
  add_index "cama_term_taxonomy", ["term_order"], name: "index_cama_term_taxonomy_on_term_order", using: :btree
  add_index "cama_term_taxonomy", ["user_id"], name: "index_cama_term_taxonomy_on_user_id", using: :btree

  create_table "cama_user_relationships", force: :cascade do |t|
    t.integer "term_order",       limit: 4
    t.integer "active",           limit: 4, default: 1
    t.integer "term_taxonomy_id", limit: 4
    t.integer "user_id",          limit: 4
  end

  add_index "cama_user_relationships", ["term_taxonomy_id"], name: "index_cama_user_relationships_on_term_taxonomy_id", using: :btree
  add_index "cama_user_relationships", ["user_id"], name: "index_cama_user_relationships_on_user_id", using: :btree

  create_table "cama_users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.string   "role",                   limit: 255, default: "client"
    t.string   "email",                  limit: 255
    t.string   "slug",                   limit: 255
    t.string   "password_digest",        limit: 255
    t.string   "auth_token",             limit: 255
    t.string   "password_reset_token",   limit: 255
    t.integer  "parent_id",              limit: 4
    t.datetime "password_reset_sent_at"
    t.datetime "last_login_at"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "site_id",                limit: 4,   default: -1
    t.string   "confirm_email_token",    limit: 255
    t.datetime "confirm_email_sent_at"
    t.boolean  "is_valid_email",                     default: true
  end

  add_index "cama_users", ["email"], name: "index_cama_users_on_email", using: :btree
  add_index "cama_users", ["role"], name: "index_cama_users_on_role", using: :btree
  add_index "cama_users", ["site_id"], name: "index_cama_users_on_site_id", using: :btree
  add_index "cama_users", ["username"], name: "index_cama_users_on_username", using: :btree

end
