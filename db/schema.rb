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

ActiveRecord::Schema.define(version: 2021_03_05_151508) do

  create_table "achievements", force: :cascade do |t|
    t.string "value"
    t.integer "employment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employment_id"], name: "index_achievements_on_employment_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_infos", force: :cascade do |t|
    t.integer "address_id", null: false
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_contact_infos_on_address_id"
  end

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "degree_concentrations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "degree_designations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "degree_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string "external_key", null: false
    t.datetime "end_date"
    t.datetime "start_date"
    t.integer "degree_concentration_id", null: false
    t.integer "degree_type_id", null: false
    t.integer "degree_designation_id", null: false
    t.integer "education_id", null: false
    t.boolean "was_completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["degree_concentration_id"], name: "index_degrees_on_degree_concentration_id"
    t.index ["degree_designation_id"], name: "index_degrees_on_degree_designation_id"
    t.index ["degree_type_id"], name: "index_degrees_on_degree_type_id"
    t.index ["education_id"], name: "index_degrees_on_education_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "external_key", null: false
    t.integer "organization_id", null: false
    t.integer "curriculum_vitae_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curriculum_vitae_id"], name: "index_educations_on_curriculum_vitae_id"
    t.index ["organization_id"], name: "index_educations_on_organization_id"
  end

  create_table "employments", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "curriculum_vitae_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "impact"
    t.string "external_key", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curriculum_vitae_id"], name: "index_employments_on_curriculum_vitae_id"
    t.index ["organization_id"], name: "index_employments_on_organization_id"
  end

  create_table "employments_skills", id: false, force: :cascade do |t|
    t.integer "employment_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employment_id", "skill_id"], name: "index_employments_skills_on_employment_id_and_skill_id", unique: true
    t.index ["employment_id"], name: "index_employments_skills_on_employment_id"
    t.index ["skill_id"], name: "index_employments_skills_on_skill_id"
  end

  create_table "organization_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "external_key", null: false
    t.integer "contact_info_id", null: false
    t.string "name"
    t.integer "organization_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_info_id"], name: "index_organizations_on_contact_info_id"
    t.index ["organization_type_id"], name: "index_organizations_on_organization_type_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.integer "employment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employment_id"], name: "index_positions_on_employment_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "external_key", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "contact_info_id", null: false
    t.integer "curriculum_vitae_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_info_id"], name: "index_profiles_on_contact_info_id"
    t.index ["curriculum_vitae_id"], name: "index_profiles_on_curriculum_vitae_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "responsibilities", force: :cascade do |t|
    t.string "value"
    t.integer "position_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position_id"], name: "index_responsibilities_on_position_id"
  end

  create_table "skill_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "curriculum_vitae_id", null: false
    t.integer "skill_category_id", null: false
    t.decimal "years_experience"
    t.decimal "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curriculum_vitae_id"], name: "index_skills_on_curriculum_vitae_id"
    t.index ["skill_category_id"], name: "index_skills_on_skill_category_id"
  end

  create_table "social_media", force: :cascade do |t|
    t.string "name"
    t.string "site"
    t.string "external_key", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "social_media_accounts", force: :cascade do |t|
    t.integer "social_media_id", null: false
    t.integer "profile_id", null: false
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_social_media_accounts_on_profile_id"
    t.index ["social_media_id"], name: "index_social_media_accounts_on_social_media_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "achievements", "employments"
  add_foreign_key "contact_infos", "addresses"
  add_foreign_key "degrees", "degree_concentrations"
  add_foreign_key "degrees", "degree_designations"
  add_foreign_key "degrees", "degree_types"
  add_foreign_key "degrees", "educations"
  add_foreign_key "educations", "curriculum_vitaes"
  add_foreign_key "educations", "organizations"
  add_foreign_key "employments", "curriculum_vitaes"
  add_foreign_key "employments", "organizations"
  add_foreign_key "employments_skills", "employments"
  add_foreign_key "employments_skills", "skills"
  add_foreign_key "organizations", "contact_infos"
  add_foreign_key "organizations", "organization_types"
  add_foreign_key "positions", "employments"
  add_foreign_key "profiles", "contact_infos"
  add_foreign_key "profiles", "curriculum_vitaes"
  add_foreign_key "profiles", "users"
  add_foreign_key "responsibilities", "positions"
  add_foreign_key "skills", "curriculum_vitaes"
  add_foreign_key "skills", "skill_categories"
  add_foreign_key "social_media_accounts", "profiles"
  add_foreign_key "social_media_accounts", "social_media", column: "social_media_id"
end
