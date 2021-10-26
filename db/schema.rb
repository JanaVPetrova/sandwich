# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_25_204007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredient_groups", id: :serial, force: :cascade do |t|
    t.text "title"
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", id: :serial, force: :cascade do |t|
    t.text "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carbohydrates_mg"
    t.integer "fat_mg"
    t.integer "protein_mg"
    t.index ["title"], name: "ingredients_title_index", unique: true
  end

  create_table "recipe_ingredients", id: :serial, force: :cascade do |t|
    t.integer "ingredient_id"
    t.decimal "quantity", default: "0.0"
    t.text "unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "carbohydrates_mg"
    t.decimal "fat_mg"
    t.decimal "protein_mg"
    t.decimal "unit_mg"
    t.text "title"
    t.integer "ingredient_group_id"
    t.decimal "carbohydrates_g"
    t.decimal "fat_g"
    t.decimal "protein_g"
    t.decimal "unit_g"
  end

  create_table "recipes", id: :serial, force: :cascade do |t|
    t.text "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "image_data"
    t.text "description"
    t.boolean "secret", default: false
    t.string "state", default: "draft", null: false
  end

  create_table "shopping_list_items", id: :serial, force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "shopping_list_id", null: false
    t.text "title"
    t.decimal "quantity"
    t.text "unit"
    t.boolean "checked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_lists", id: :serial, force: :cascade do |t|
    t.text "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "users_email_index", unique: true
  end

  add_foreign_key "ingredient_groups", "recipes", name: "ingredient_groups_recipe_id_fkey", on_delete: :cascade
  add_foreign_key "recipe_ingredients", "ingredient_groups", name: "recipe_ingredients_ingredient_group_id_fkey"
  add_foreign_key "recipe_ingredients", "ingredients", name: "recipe_ingredients_ingredient_id_fkey", on_delete: :cascade
  add_foreign_key "recipes", "users", name: "recipes_user_id_fkey"
  add_foreign_key "shopping_list_items", "ingredients", name: "shopping_list_items_ingredient_id_fkey", on_delete: :cascade
  add_foreign_key "shopping_list_items", "shopping_lists", name: "shopping_list_items_shopping_list_id_fkey", on_delete: :cascade
  add_foreign_key "shopping_lists", "users", name: "shopping_lists_user_id_fkey"
end
