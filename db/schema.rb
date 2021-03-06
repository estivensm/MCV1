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

ActiveRecord::Schema.define(version: 20190211230834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accions", id: :serial, force: :cascade do |t|
    t.string "codigo"
    t.string "employed_id"
    t.text "descripcion"
    t.string "tipo"
    t.integer "costo"
    t.integer "f_seguimiento"
    t.date "f_compromiso"
    t.date "f_real"
    t.string "estado"
    t.boolean "cumplio"
    t.integer "contador"
    t.text "evidencia"
    t.integer "contador_seg"
    t.integer "user_id"
    t.integer "admin_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "report_id"
    t.date "fp_seguimiento"
    t.boolean "tag"
    t.boolean "eficaz"
    t.integer "cierra_id"
    t.string "name"
    t.boolean "s_cierre"
    t.boolean "change_cumplio"
    t.text "justificacion_cumplio"
    t.boolean "send_mail"
    t.integer "costo_presupuestado"
    t.boolean "estado_vencida"
    t.boolean "estado_proxima"
    t.boolean "estado_vigente"
    t.date "start_date"
  end

  create_table "accions_causa_efectos", id: false, force: :cascade do |t|
    t.integer "accion_id"
    t.integer "causa_efecto_id"
    t.index ["accion_id"], name: "index_accions_causa_efectos_on_accion_id"
    t.index ["causa_efecto_id"], name: "index_accions_causa_efectos_on_causa_efecto_id"
  end

  create_table "accions_employeds", id: false, force: :cascade do |t|
    t.integer "employed_id"
    t.integer "accion_id"
    t.index ["accion_id"], name: "index_accions_employeds_on_accion_id"
    t.index ["employed_id"], name: "index_accions_employeds_on_employed_id"
  end

  create_table "amefps", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "report_id"
    t.integer "causa_id"
    t.text "descripcion"
    t.integer "employed_id"
    t.boolean "p_valoracion"
    t.date "frp_valoracion"
    t.text "dp_valoracion"
    t.integer "p_valor"
    t.boolean "s_valoracion"
    t.date "frs_valoracion"
    t.text "ds_valoracion"
    t.integer "s_valor"
    t.boolean "t_valoracion"
    t.date "frt_valoracion"
    t.text "dt_valoracion"
    t.integer "t_valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "npr_tage"
  end

  create_table "amefs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "report_id"
    t.integer "causa_id"
    t.string "efecto_fallo"
    t.integer "grado"
    t.string "tipo"
    t.string "modo_fallo"
    t.string "causa_fallo"
    t.integer "p_ocurrencia"
    t.string "c_actuales"
    t.integer "pn_deteccion"
    t.integer "npr"
    t.integer "employed_id"
    t.integer "sgrado"
    t.integer "tgrado"
    t.integer "sp_ocurrencia"
    t.integer "tp_ocurrencia"
    t.integer "spn_deteccion"
    t.integer "tpn_deteccion"
    t.integer "snpr"
    t.integer "tnpr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amefp_id"
    t.integer "causa_efecto_id"
    t.string "a_tomar"
    t.string "estado"
    t.string "sestado"
    t.string "testado"
    t.boolean "accion_ok"
  end

  create_table "aseguimientos", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.date "f_seguimiento"
    t.text "descripcion"
    t.boolean "cierra"
    t.boolean "eficaz"
    t.text "conclucion"
    t.integer "costo"
    t.string "evidencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "accion_id"
    t.boolean "s_cierre"
    t.boolean "send_mail"
    t.string "type_tracing"
  end

  create_table "cargos", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "proceso_id"
    t.integer "user_id"
    t.integer "admin_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causa_efectos", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.string "nivel"
    t.string "descripcion"
    t.string "tipo"
    t.integer "causa_id"
    t.integer "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "frecuencia"
    t.float "porcentaje"
    t.string "estado"
    t.string "subnivel"
    t.integer "accion_id"
    t.boolean "estado_accion"
  end

  create_table "causas", id: :serial, force: :cascade do |t|
    t.string "tipo"
    t.text "descripcion"
    t.string "archivo"
    t.integer "admin_user"
    t.integer "user_id"
    t.integer "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "primera_m"
    t.string "seguna_m"
    t.string "tercera_m"
    t.string "cuarta_m"
    t.string "quinta_m"
    t.string "sexta_m"
  end

  create_table "classification_risks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.string "name"
    t.text "description"
    t.string "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cliente_proveedor_types", force: :cascade do |t|
    t.integer "admin_user"
    t.integer "user_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clinte_proveedors", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.string "name"
    t.string "pbx"
    t.string "address"
    t.string "nit"
    t.string "correo_empresa"
    t.string "contact_name"
    t.string "contact_telephone"
    t.string "contact_email"
    t.string "tipo"
    t.string "web"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_proveedor_type_id"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "phone"
    t.string "address"
    t.string "nit"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin_user"
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "mobil"
    t.string "email"
    t.string "cargo"
    t.integer "clinte_proveedor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "admin_user"
  end

  create_table "employeds", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "first_last_name"
    t.string "second_last_name"
    t.string "document_type"
    t.string "document"
    t.date "birth_date"
    t.string "genero"
    t.integer "admin_user"
    t.integer "user_id"
    t.string "avatare"
    t.string "email"
    t.integer "cargo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "password_c"
    t.boolean "is_user"
    t.string "user_name"
    t.integer "rol_id"
  end

  create_table "employeds_reports", id: false, force: :cascade do |t|
    t.integer "employed_id"
    t.integer "report_id"
    t.index ["employed_id"], name: "index_employeds_reports_on_employed_id"
    t.index ["report_id"], name: "index_employeds_reports_on_report_id"
  end

  create_table "normas", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "admin_user"
    t.string "archivo"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tipo"
    t.boolean "admin"
  end

  create_table "numerals", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "norma_id"
    t.text "description"
    t.string "numeral"
    t.string "norma_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "clausula"
    t.string "subtitulo"
    t.string "subclausula"
    t.integer "numeral_count"
    t.text "subclausula_description"
  end

  create_table "numerals_reports", id: false, force: :cascade do |t|
    t.integer "report_id"
    t.integer "numeral_id"
    t.index ["numeral_id"], name: "index_numerals_reports_on_numeral_id"
    t.index ["report_id"], name: "index_numerals_reports_on_report_id"
  end

  create_table "page_documents", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
    t.integer "admin_user"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procesos", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.integer "admin_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", id: :serial, force: :cascade do |t|
    t.integer "employed_id"
    t.integer "proceso_id"
    t.text "description"
    t.text "requisito"
    t.text "evidencia"
    t.string "nc_type"
    t.string "accion"
    t.text "justificacion"
    t.integer "user_id"
    t.integer "admin_user"
    t.string "state"
    t.string "codigo"
    t.integer "contador"
    t.integer "source_id"
    t.string "archivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employed_reporta"
    t.integer "f_seguimiento"
    t.date "f_compromiso"
    t.date "f_real"
    t.date "fp_seguimiento"
    t.integer "contador_seg"
    t.integer "costo"
    t.boolean "cumplio"
    t.integer "clinte_proveedor_id"
    t.integer "contact_id"
    t.boolean "tag"
    t.integer "cierra_id"
    t.string "name"
    t.string "balon"
    t.boolean "s_cierre"
    t.boolean "eficaz"
    t.text "conclucion"
    t.boolean "change_cumplio"
    t.text "justificacion_cumplio"
    t.boolean "send_mail"
    t.integer "source_parent_id"
    t.integer "costo_presupuestado"
    t.boolean "estado_vencida"
    t.boolean "estado_proxima"
    t.boolean "estado_vigente"
    t.integer "riesgo_id"
    t.date "start_date"
    t.integer "accion_id"
    t.integer "report_id"
  end

  create_table "riesgos", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "report_id"
    t.integer "accion_id"
    t.text "descripcion"
    t.string "clasificacion"
    t.string "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "context"
    t.string "treatment"
    t.integer "classification_risk_id"
    t.text "justification"
    t.boolean "state"
    t.boolean "risk_state"
    t.integer "risk_value"
    t.integer "proceso_id"
    t.string "risk_level"
    t.integer "risk_source_id"
  end

  create_table "risk_sources", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.string "name"
    t.text "description"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols", id: :serial, force: :cascade do |t|
    t.integer "admin_user"
    t.integer "user_id"
    t.boolean "configuracion"
    t.boolean "report_ver"
    t.boolean "report_crear"
    t.boolean "report_edit"
    t.boolean "report_delete"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "report_procesos"
    t.boolean "default"
    t.boolean "create_all"
  end

  create_table "rseguimientos", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.date "f_seguimiento"
    t.text "descripcion"
    t.integer "report_id"
    t.string "evidencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "s_cierre"
    t.boolean "cerrar"
    t.boolean "eficaz"
    t.text "conclucion"
    t.boolean "send_mail"
    t.string "type_tracing"
  end

  create_table "source_parents", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
    t.integer "admin_user"
    t.string "codigo"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_parents_sources", id: false, force: :cascade do |t|
    t.integer "source_parent_id"
    t.integer "source_id"
    t.index ["source_id"], name: "index_source_parents_sources_on_source_id"
    t.index ["source_parent_id"], name: "index_source_parents_sources_on_source_parent_id"
  end

  create_table "sources", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.integer "admin_user"
    t.boolean "state"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accion"
    t.boolean "correccion"
    t.boolean "causa"
    t.boolean "puede_ac"
    t.string "codigo"
    t.string "tipo"
    t.boolean "balon"
    t.boolean "evidencia"
    t.boolean "requisito"
    t.boolean "numerales"
    t.boolean "task"
    t.boolean "actividad"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "employed_id"
    t.integer "report_id"
    t.string "name"
    t.text "observacion"
    t.integer "costo"
    t.date "f_compromiso"
    t.date "f_real"
    t.boolean "estado"
    t.boolean "cumplio"
    t.integer "contador"
    t.integer "contador_seg"
    t.string "anexo"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "change_cumplio"
    t.text "justificacion_cumplio"
    t.boolean "send_mail"
    t.integer "accion_id"
    t.boolean "estado_vencida"
    t.boolean "estado_proxima"
    t.boolean "estado_vigente"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "avatar"
    t.integer "admin_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
    t.integer "rol_id"
    t.string "role"
    t.integer "employed_id"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email"
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "valoration_risks", force: :cascade do |t|
    t.boolean "controls"
    t.integer "np_value"
    t.integer "ne_value"
    t.integer "nd_value"
    t.string "np_text"
    t.string "ne_text"
    t.string "nd_text"
    t.integer "nc_value"
    t.string "nc_text"
    t.text "probability_indicator"
    t.text "impact_indicator"
    t.integer "nr_value"
    t.string "risk_level"
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "riesgo_id"
    t.date "next_valoration"
    t.date "valoration_date"
    t.text "analysis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "controls_description"
    t.integer "count"
  end

end
