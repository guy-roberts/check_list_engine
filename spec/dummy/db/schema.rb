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

ActiveRecord::Schema.define(version: 20180228151520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_list_engine_audit_type_components", force: :cascade do |t|
    t.string "title"
    t.integer "audit_type_id"
    t.string "help_text"
    t.integer "position"
    t.integer "available_component_id"
    t.boolean "has_image"
    t.string "choices"
    t.boolean "is_mandatory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_list_engine_audit_types", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_list_engine_available_components", force: :cascade do |t|
    t.string "title"
    t.string "has_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
