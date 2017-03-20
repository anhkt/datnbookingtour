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

ActiveRecord::Schema.define(version: 20170320091426) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "num_tourist"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_address"
    t.text     "description"
    t.float    "total_price"
    t.integer  "status"
    t.integer  "tour_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["tour_id"], name: "index_bookings_on_tour_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "parent_id"
    t.integer  "review_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.integer  "place_type"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rate"
    t.integer  "user_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["rateable_type", "rateable_id"], name: "index_ratings_on_rateable_type_and_rateable_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "review_type"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "tour_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["tour_id"], name: "index_reviews_on_tour_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tour_places", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_tour_places_on_place_id"
    t.index ["tour_id"], name: "index_tour_places_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.float    "price_per_person"
    t.text     "description"
    t.integer  "num_people"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "status"
    t.float    "discount"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["category_id"], name: "index_tours_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "email"
    t.string   "avatar"
    t.boolean  "is_admin"
    t.string   "digest_password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
