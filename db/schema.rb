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

ActiveRecord::Schema.define(version: 20160830110407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "negotiators", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", force: :cascade do |t|
    t.text     "lat"
    t.text     "lon"
    t.float    "distance",       default: 0.0
    t.integer  "visit_duration", default: 0
    t.integer  "position"
    t.integer  "route_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name",           default: "point"
    t.datetime "arrival_time"
    t.index ["route_id"], name: "index_points_on_route_id", using: :btree
  end

  create_table "routes", force: :cascade do |t|
    t.integer  "negotiator_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.datetime "date",          default: '2016-08-29 23:00:00'
    t.integer  "duration",      default: 0
    t.index ["negotiator_id"], name: "index_routes_on_negotiator_id", using: :btree
  end

  add_foreign_key "points", "routes"
  add_foreign_key "routes", "negotiators"
end
