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

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_02_03_115759) do
=======
ActiveRecord::Schema.define(version: 2019_02_03_775217) do
>>>>>>> 作成途中
=======
ActiveRecord::Schema.define(version: 2019_02_03_714314) do
>>>>>>> 故障

  create_table "affiliations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "university", default: "", null: false
    t.string "department", default: "", null: false
    t.string "course", default: "", null: false
    t.string "labo", default: "", null: false
    t.string "cord", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category", default: "", null: false
    t.bigint "experiment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_categories_on_experiment_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "experiment_id"
    t.bigint "user_id"
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_comments_on_experiment_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "experiments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.date "date", null: false
    t.text "overview", null: false
    t.text "result", null: false
    t.bigint "protocol_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["protocol_id"], name: "index_experiments_on_protocol_id"
    t.index ["user_id"], name: "index_experiments_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", default: "", null: false
    t.bigint "experiment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_images_on_experiment_id"
  end

  create_table "procedures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "protocol_id"
    t.text "text", null: false
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["protocol_id"], name: "index_procedures_on_protocol_id"
  end

  create_table "protocols", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "affiliation_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.integer "parent_id", default: 0, null: false
    t.string "title", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.bigint "affiliation_id"
    t.string "avatar", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affiliation_id"], name: "index_users_on_affiliation_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "experiments"
  add_foreign_key "comments", "experiments"
  add_foreign_key "comments", "users"
  add_foreign_key "experiments", "protocols"
  add_foreign_key "experiments", "users"
  add_foreign_key "images", "experiments"
  add_foreign_key "procedures", "protocols"
  add_foreign_key "protocols", "affiliations"
  add_foreign_key "protocols", "users"
  add_foreign_key "users", "affiliations"
end
