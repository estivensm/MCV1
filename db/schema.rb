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

ActiveRecord::Schema.define(version: 20170202201352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accions", force: :cascade do |t|
    t.string   "codigo"
    t.string   "employed_id"
    t.text     "descripcion"
    t.string   "tipo"
    t.integer  "costo"
    t.integer  "f_seguimiento"
    t.date     "f_compromiso"
    t.date     "f_real"
    t.string   "estado"
    t.boolean  "cumplio"
    t.integer  "contador"
    t.text     "evidencia"
    t.integer  "contador_seg"
    t.integer  "user_id"
    t.integer  "admin_user"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "report_id"
    t.date     "fp_seguimiento"
  end

  create_table "accions_employeds", id: false, force: :cascade do |t|
    t.integer "employed_id"
    t.integer "accion_id"
    t.index ["accion_id"], name: "index_accions_employeds_on_accion_id", using: :btree
    t.index ["employed_id"], name: "index_accions_employeds_on_employed_id", using: :btree
  end

  create_table "aseguimientos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "admin_user"
    t.date     "f_seguimiento"
    t.text     "descripcion"
    t.boolean  "cierra"
    t.boolean  "eficaz"
    t.text     "conclucion"
    t.integer  "costo"
    t.string   "evidencia"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "accion_id"
  end

  create_table "cargos", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "proceso_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "admin_user"
  end

  create_table "causas", force: :cascade do |t|
    t.string   "tipo"
    t.text     "descripcion"
    t.string   "archivo"
    t.integer  "admin_user"
    t.integer  "user_id"
    t.integer  "report_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "phone"
    t.string   "address"
    t.string   "nit"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employeds", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "first_last_name"
    t.string   "second_last_name"
    t.string   "document_type"
    t.string   "document"
    t.date     "birth_date"
    t.string   "genero"
    t.integer  "admin_user"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "cargo_id"
    t.string   "email"
    t.string   "avatare"
  end

  create_table "employeds_reports", id: false, force: :cascade do |t|
    t.integer "employed_id"
    t.integer "report_id"
    t.index ["employed_id"], name: "index_employeds_reports_on_employed_id", using: :btree
    t.index ["report_id"], name: "index_employeds_reports_on_report_id", using: :btree
  end

  create_table "normas", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "admin_user"
    t.string   "archivo"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "numerals", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "admin_user"
    t.integer  "norma_id"
    t.text     "description"
    t.string   "numeral"
    t.string   "norma_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "numerals_reports", id: false, force: :cascade do |t|
    t.integer "report_id"
    t.integer "numeral_id"
    t.index ["numeral_id"], name: "index_numerals_reports_on_numeral_id", using: :btree
    t.index ["report_id"], name: "index_numerals_reports_on_report_id", using: :btree
  end

  create_table "procesos", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "admin_user"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "employed_id"
    t.integer  "proceso_id"
    t.text     "description"
    t.text     "requisito"
    t.text     "evidencia"
    t.string   "nc_type"
    t.string   "accion"
    t.text     "justificacion"
    t.integer  "user_id"
    t.integer  "admin_user"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "state"
    t.string   "codigo"
    t.integer  "contador"
    t.integer  "source_id"
    t.string   "archivo"
    t.integer  "employed_reporta"
    t.integer  "f_seguimiento"
    t.date     "f_compromiso"
    t.date     "f_real"
    t.date     "fp_seguimiento"
    t.integer  "contador_seg"
    t.integer  "costo"
    t.boolean  "cumplio"
  end

  create_table "rseguimientos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "admin_user"
    t.date     "f_seguimiento"
    t.text     "descripcion"
    t.integer  "report_id"
    t.string   "evidencia"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "admin_user"
    t.boolean  "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "default"
    t.boolean  "accion"
    t.boolean  "correccion"
    t.boolean  "causa"
    t.boolean  "puede_ac"
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.string   "avatar"
    t.integer  "admin_user"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "rol"
    t.string   "company"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
