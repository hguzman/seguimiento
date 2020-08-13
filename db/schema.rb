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

ActiveRecord::Schema.define(version: 2020_08_13_145719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ambientes", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "anotaciones", force: :cascade do |t|
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "anotable_type", null: false
    t.bigint "anotable_id", null: false
    t.integer "created_by"
    t.integer "updated_by"
    t.string "file"
    t.index ["anotable_type", "anotable_id"], name: "index_anotaciones_on_anotable_type_and_anotable_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "comentario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "anotacion_id", null: false
    t.integer "created_by"
    t.integer "updated_by"
    t.string "file"
    t.index ["anotacion_id"], name: "index_comentarios_on_anotacion_id"
  end

  create_table "especialidades", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fichas", force: :cascade do |t|
    t.integer "numero"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "numero_aprendices"
    t.date "fecha_fin_at"
    t.bigint "programa_id"
    t.index ["programa_id"], name: "index_fichas_on_programa_id"
  end

  create_table "programas", force: :cascade do |t|
    t.string "nombre"
    t.bigint "especialidad_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["especialidad_id"], name: "index_programas_on_especialidad_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tipodocumentos", force: :cascade do |t|
    t.string "nombre"
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
    t.string "nombres"
    t.string "apellidos"
    t.string "ndocumento"
    t.bigint "telefono"
    t.string "direccion"
    t.string "avatar"
    t.bigint "ficha_id"
    t.bigint "tipodocumento_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["ficha_id"], name: "index_users_on_ficha_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tipodocumento_id"], name: "index_users_on_tipodocumento_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "comentarios", "anotaciones"
  add_foreign_key "fichas", "programas"
  add_foreign_key "programas", "especialidades"
  add_foreign_key "users", "tipodocumentos"
end
