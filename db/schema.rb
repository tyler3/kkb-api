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

ActiveRecord::Schema[8.0].define(version: 2025_11_14_015338) do
  create_table "accident_reports", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.integer "report_type", limit: 1, null: false
    t.date "reported_on"
    t.datetime "occurred_at", precision: nil
    t.datetime "ended_at", precision: nil
    t.string "medical_institution"
    t.string "prescribing_physician"
    t.string "patient_name"
    t.integer "patient_age", limit: 1
    t.string "contact_name"
    t.date "patient_birthday"
    t.string "contact_tel"
    t.text "overview", size: :medium
    t.text "response", size: :medium
    t.text "cause_and_remedy", size: :medium
    t.integer "status", limit: 1, default: 1, null: false
    t.integer "kkb_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "audited_by_id"
    t.integer "dosed_by_id"
    t.boolean "completed", default: true, null: false
    t.index ["audited_by_id"], name: "index_accident_reports_on_audited_by_id"
    t.index ["created_by_id"], name: "index_accident_reports_on_created_by_id"
    t.index ["department_id"], name: "index_accident_reports_on_department_id"
    t.index ["dosed_by_id"], name: "index_accident_reports_on_dosed_by_id"
    t.index ["kkb_id"], name: "index_accident_reports_on_kkb_id"
    t.index ["updated_by_id"], name: "index_accident_reports_on_updated_by_id"
    t.index ["user_id"], name: "index_accident_reports_on_user_id"
  end

  create_table "accounting_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id"
    t.string "code"
    t.string "name"
    t.string "sub_code"
    t.string "sub_name"
    t.integer "disp_level"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hidden", default: false
    t.integer "debit_tax_type", limit: 2
    t.integer "credit_tax_type", limit: 2
    t.integer "tax_autocalc", limit: 1
    t.integer "tax_rate", limit: 1
    t.index ["company_id", "code", "sub_code"], name: "index_accounting_items_on_company_id_and_code_and_sub_code", unique: true
    t.index ["company_id"], name: "index_accounting_items_on_company_id"
  end

  create_table "action_text_rich_texts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata", size: :medium
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_extensions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "file_id", null: false
    t.integer "created_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "comment"
    t.index ["created_by_id"], name: "index_active_storage_extensions_on_created_by_id"
    t.index ["file_id"], name: "index_active_storage_extensions_on_file_id", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "allowance_payments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "allowance_id", null: false
    t.integer "user_id", null: false
    t.date "month", null: false
    t.integer "amount", default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["allowance_id", "user_id", "month"], name: "allowance_payments_index", unique: true
    t.index ["allowance_id"], name: "index_allowance_payments_on_allowance_id"
    t.index ["created_by_id"], name: "index_allowance_payments_on_created_by_id"
    t.index ["updated_by_id"], name: "index_allowance_payments_on_updated_by_id"
    t.index ["user_id"], name: "index_allowance_payments_on_user_id"
  end

  create_table "allowance_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "allowance_id", null: false
    t.integer "user_id", null: false
    t.date "start_month"
    t.date "end_month"
    t.integer "unit_amount"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.integer "unit_label", limit: 1, default: 0, null: false
    t.string "comment"
    t.index ["allowance_id", "user_id"], name: "allowance_users_index"
    t.index ["allowance_id"], name: "index_allowance_users_on_allowance_id"
    t.index ["created_by_id"], name: "index_allowance_users_on_created_by_id"
    t.index ["updated_by_id"], name: "index_allowance_users_on_updated_by_id"
    t.index ["user_id"], name: "index_allowance_users_on_user_id"
  end

  create_table "allowances", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.integer "data_type", limit: 1, null: false
    t.string "comment"
    t.boolean "hidden", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "category", limit: 1
    t.integer "standard_amount"
    t.integer "rank"
    t.index ["code"], name: "index_allowances_on_code", unique: true
    t.index ["created_by_id"], name: "index_allowances_on_created_by_id"
    t.index ["updated_by_id"], name: "index_allowances_on_updated_by_id"
  end

  create_table "app_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "basic_app_id", null: false
    t.integer "code", limit: 2, null: false
    t.integer "sub_code", limit: 1, default: 0, null: false
    t.string "value"
    t.index ["basic_app_id"], name: "index_app_values_on_basic_app_id"
  end

  create_table "area_daily_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "area_id", null: false
    t.date "day", null: false
    t.integer "comment_type", limit: 1, null: false
    t.text "text", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["area_id", "day", "comment_type"], name: "area_daily_comments_index", unique: true
    t.index ["area_id"], name: "index_area_daily_comments_on_area_id"
    t.index ["created_by_id"], name: "index_area_daily_comments_on_created_by_id"
    t.index ["updated_by_id"], name: "index_area_daily_comments_on_updated_by_id"
  end

  create_table "areas", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "hidden", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "short_name"
    t.integer "rank"
  end

  create_table "areas_regions", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "area_id", null: false
    t.integer "region_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["area_id", "region_id"], name: "index_areas_regions_on_area_id_and_region_id", unique: true
    t.index ["area_id"], name: "index_areas_regions_on_area_id"
    t.index ["region_id"], name: "index_areas_regions_on_region_id"
  end

  create_table "assessment_answers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "assessment_id", null: false
    t.integer "assessment_question_id", null: false
    t.integer "evaluation", limit: 1, default: 1, null: false
    t.index ["assessment_id", "assessment_question_id"], name: "assessment_answers_assessment_question_index", unique: true
    t.index ["assessment_id"], name: "index_assessment_answers_on_assessment_id"
    t.index ["assessment_question_id"], name: "index_assessment_answers_on_assessment_question_id"
  end

  create_table "assessment_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "assessment_question_id", null: false
    t.integer "priority", limit: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "assessment_pattern_id", null: false
    t.index ["assessment_pattern_id"], name: "index_assessment_categories_on_assessment_pattern_id"
    t.index ["assessment_question_id"], name: "index_assessment_categories_on_assessment_question_id"
  end

  create_table "assessment_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name"], name: "index_assessment_groups_on_name"
  end

  create_table "assessment_patterns", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_assessment_patterns_on_code", unique: true
  end

  create_table "assessment_question_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "assessment_question_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "assessment_group_id", null: false
    t.index ["assessment_group_id"], name: "index_assessment_question_groups_on_assessment_group_id"
    t.index ["assessment_question_id"], name: "index_assessment_question_groups_on_assessment_question_id"
  end

  create_table "assessment_questions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "start_period"
    t.date "end_period"
    t.text "question_text", null: false
    t.integer "rank", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "assessments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "evaluator_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.date "evaluation_date", null: false
    t.index ["evaluator_id"], name: "index_assessments_on_evaluator_id"
    t.index ["user_id", "evaluator_id", "evaluation_date"], name: "assessments_user_date_index", unique: true
    t.index ["user_id"], name: "index_assessments_on_user_id"
  end

  create_table "assign_shops", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.integer "assign_type", limit: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "wday", limit: 1
    t.index ["department_id"], name: "index_assign_shops_on_department_id"
    t.index ["user_id"], name: "index_assign_shops_on_user_id"
  end

  create_table "attachment_files", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "resource_type"
    t.integer "resource_id"
    t.integer "user_id"
    t.string "file"
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "code"
    t.integer "data_type", limit: 1
    t.index ["code"], name: "index_attachment_files_on_code", unique: true
    t.index ["resource_type", "resource_id"], name: "index_attachment_files_on_resource_type_and_resource_id"
    t.index ["user_id"], name: "index_attachment_files_on_user_id"
  end

  create_table "attachments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.string "file_name"
    t.string "file_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "file"
    t.string "code"
    t.index ["code"], name: "index_attachments_on_code", unique: true
    t.index ["kkb_id"], name: "index_attachments_on_kkb_id"
  end

  create_table "auth_action_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "auth_action_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["auth_action_id", "group_id"], name: "index_auth_action_groups_on_auth_action_id_and_group_id", unique: true
    t.index ["auth_action_id"], name: "index_auth_action_groups_on_auth_action_id"
    t.index ["group_id"], name: "index_auth_action_groups_on_group_id"
  end

  create_table "auth_action_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "auth_action_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["auth_action_id", "user_id"], name: "index_auth_action_users_on_auth_action_id_and_user_id", unique: true
    t.index ["auth_action_id"], name: "index_auth_action_users_on_auth_action_id"
    t.index ["user_id"], name: "index_auth_action_users_on_user_id"
  end

  create_table "auth_actions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "controller"
    t.string "action"
    t.integer "group_id"
    t.integer "auth_type", limit: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.integer "parent_id"
    t.index ["controller", "action"], name: "index_auth_actions_on_controller_and_action", unique: true
    t.index ["group_id"], name: "index_auth_actions_on_group_id"
    t.index ["parent_id"], name: "index_auth_actions_on_parent_id"
  end

  create_table "bank_accounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.string "bank_code"
    t.string "bank_name"
    t.string "bank_kana"
    t.string "branch_code"
    t.string "branch_name"
    t.string "branch_kana"
    t.integer "deposit_type"
    t.string "account_number"
    t.string "account_name"
    t.string "account_kana"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "bank_book_amounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "month"
    t.integer "department_id"
    t.integer "expense_bank_account_id"
    t.integer "amount"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id"], name: "index_bank_book_amounts_on_department_id"
    t.index ["expense_bank_account_id"], name: "index_bank_book_amounts_on_expense_bank_account_id"
    t.index ["month", "department_id", "expense_bank_account_id"], name: "idx_month_dep_bank", unique: true
  end

  create_table "bank_book_procs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "month", null: false
    t.integer "department_id", null: false
    t.integer "expense_bank_account_id", null: false
    t.boolean "fixed", default: false, null: false
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "fixed_by_id"
    t.datetime "fixed_at", precision: nil
    t.integer "finally_approved_by_id"
    t.datetime "finally_approved_at", precision: nil
    t.boolean "bugyo_synced", default: false, null: false
    t.string "comment"
    t.index ["department_id"], name: "index_bank_book_procs_on_department_id"
    t.index ["expense_bank_account_id"], name: "index_bank_book_procs_on_expense_bank_account_id"
    t.index ["finally_approved_by_id"], name: "index_bank_book_procs_on_finally_approved_by_id"
    t.index ["fixed_by_id"], name: "index_bank_book_procs_on_fixed_by_id"
    t.index ["month", "department_id", "expense_bank_account_id"], name: "index_month_dept_expense", unique: true
    t.index ["updated_by_id"], name: "index_bank_book_procs_on_updated_by_id"
  end

  create_table "bank_books", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id"
    t.integer "expense_item_id"
    t.string "title"
    t.string "remark"
    t.integer "data_type", limit: 1, null: false
    t.integer "amount"
    t.integer "edit_user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "expense_bank_account_id"
    t.integer "expense_file_id"
    t.string "invoice_number"
    t.integer "sub_department_id"
    t.index ["department_id"], name: "index_bank_books_on_department_id"
    t.index ["edit_user_id"], name: "fk_rails_5b93f320ff"
    t.index ["expense_bank_account_id"], name: "index_bank_books_on_expense_bank_account_id"
    t.index ["expense_file_id"], name: "index_bank_books_on_expense_file_id"
    t.index ["expense_item_id"], name: "index_bank_books_on_expense_item_id"
    t.index ["sub_department_id"], name: "index_bank_books_on_sub_department_id"
  end

  create_table "basic_apps", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "app_type", limit: 1, null: false
    t.integer "status", limit: 1, null: false
    t.integer "approved_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "month"
    t.date "fixed_on"
    t.integer "pre_approved_by_id"
    t.index ["approved_by_id"], name: "index_basic_apps_on_approved_by_id"
    t.index ["pre_approved_by_id"], name: "index_basic_apps_on_pre_approved_by_id"
    t.index ["user_id", "app_type", "month"], name: "basic_apps_index", unique: true
    t.index ["user_id"], name: "index_basic_apps_on_user_id"
  end

  create_table "biz_bank_accounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "business_connection_id", null: false
    t.string "bank_code", null: false
    t.string "bank_name", null: false
    t.string "branch_code", null: false
    t.string "branch_name", null: false
    t.integer "deposit_type", limit: 1, null: false
    t.string "account_name", null: false
    t.string "account_number", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "bank_number", null: false
    t.boolean "pay_fee", default: true, null: false
    t.string "bank_kana", null: false
    t.string "branch_kana", null: false
    t.string "account_kana", null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.index ["business_connection_id", "bank_number"], name: "biz_conn_bank_num", unique: true
    t.index ["business_connection_id"], name: "index_biz_bank_accounts_on_business_connection_id"
    t.index ["created_by_id"], name: "index_biz_bank_accounts_on_created_by_id"
    t.index ["updated_by_id"], name: "index_biz_bank_accounts_on_updated_by_id"
  end

  create_table "block_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.string "name", null: false
    t.integer "shift_block_id"
    t.integer "sort_order", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["shift_block_id"], name: "index_block_values_on_shift_block_id"
  end

  create_table "bugyo_mappings", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "bugyo_department_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["bugyo_department_id"], name: "index_bugyo_mappings_on_bugyo_department_id"
    t.index ["department_id", "bugyo_department_id"], name: "bugyo_mapping_department_index", unique: true
    t.index ["department_id"], name: "index_bugyo_mappings_on_department_id"
  end

  create_table "business_connection_accounting_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "business_connection_id", null: false
    t.integer "accounting_item_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["accounting_item_id"], name: "acc_item_index_on_biz_conn_acc_items"
    t.index ["business_connection_id", "accounting_item_id"], name: "business_connection_accounting_items_index", unique: true
    t.index ["business_connection_id"], name: "biz_conn_id_index_on_biz_conn_acc_items"
  end

  create_table "business_connections", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id"
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hidden", default: false
    t.string "original_tag"
    t.string "search_tag"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.string "invoice_number"
    t.integer "data_type", limit: 1, default: 0, null: false
    t.string "headquarters_address"
    t.boolean "need_branch_registration", default: false
    t.integer "closing_day"
    t.integer "payment_term"
    t.integer "payment_method", default: 0
    t.integer "invoice_delivery_method", default: 0
    t.string "business_field"
    t.boolean "display_in_report", default: false, null: false
    t.integer "department_id"
    t.string "invoice_delivery_post_code", limit: 10
    t.integer "invoice_delivery_prefecture", limit: 1
    t.string "invoice_delivery_municipality"
    t.string "invoice_delivery_house_number"
    t.string "invoice_delivery_building_name"
    t.string "kana"
    t.integer "invoice_delivery_destination", limit: 1
    t.integer "bank_transfer_charge", limit: 1
    t.boolean "shared_all", default: false, null: false
    t.index ["company_id", "code"], name: "index_business_connections_on_company_id_and_code", unique: true
    t.index ["company_id"], name: "index_business_connections_on_company_id"
    t.index ["created_by_id"], name: "index_business_connections_on_created_by_id"
    t.index ["department_id"], name: "index_business_connections_on_department_id"
    t.index ["updated_by_id"], name: "index_business_connections_on_updated_by_id"
  end

  create_table "business_divisions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "organization_unit_id"
    t.integer "department_id"
    t.text "business_content"
    t.text "remarks"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id"], name: "fk_rails_b89f9a656b"
    t.index ["organization_unit_id"], name: "fk_rails_3150384c91"
  end

  create_table "calendar_dest_designs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "destination_id"
    t.integer "schedule_type", limit: 1, null: false
    t.string "comment"
    t.boolean "holiday", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "wday", limit: 1
    t.integer "status", limit: 1, default: 10
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "index_calendar_dest_designs_on_created_by_id"
    t.index ["day", "destination_id", "status"], name: "calendar_dest_designs_index", unique: true
    t.index ["destination_id"], name: "index_calendar_dest_designs_on_destination_id"
    t.index ["updated_by_id"], name: "index_calendar_dest_designs_on_updated_by_id"
  end

  create_table "calendar_dests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "destination_id", null: false
    t.integer "schedule_type", limit: 1, null: false
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "generated_from", limit: 1
    t.integer "status", limit: 1, default: 10
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "index_calendar_dests_on_created_by_id"
    t.index ["day", "destination_id", "status"], name: "calendar_dests_index", unique: true
    t.index ["destination_id"], name: "index_calendar_dests_on_destination_id"
    t.index ["updated_by_id"], name: "index_calendar_dests_on_updated_by_id"
  end

  create_table "capture_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "business_connection_code"
    t.string "business_connection_company_code"
    t.string "debit_department_code"
    t.integer "debit_account_code"
    t.integer "debit_account_sub_code"
    t.string "credit_department_code"
    t.integer "credit_account_code"
    t.integer "credit_account_sub_code"
    t.string "abstract"
    t.string "supplier_abstract"
    t.integer "journal_entry_pattern_group_no", null: false
    t.integer "payment_terms"
    t.boolean "delete_flg", default: false, null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.integer "tax_class_code", limit: 1
    t.integer "tax_rate_code", limit: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_capture_categories_on_created_by_id"
    t.index ["updated_by_id"], name: "index_capture_categories_on_updated_by_id"
  end

  create_table "cash_counts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "money_10000_count", default: 0, null: false
    t.integer "money_5000_count", default: 0, null: false
    t.integer "money_2000_count", default: 0, null: false
    t.integer "money_1000_count", default: 0, null: false
    t.integer "money_500_count", default: 0, null: false
    t.integer "money_100_count", default: 0, null: false
    t.integer "money_50_count", default: 0, null: false
    t.integer "money_10_count", default: 0, null: false
    t.integer "money_5_count", default: 0, null: false
    t.integer "money_1_count", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "department_id", "data_type"], name: "index_cash_counts_on_day_and_department_id_and_data_type", unique: true
    t.index ["department_id"], name: "index_cash_counts_on_department_id"
  end

  create_table "cash_reserves", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "daily_journal_item_id", null: false
    t.integer "deposit", default: 0, null: false
    t.integer "withdraw", default: 0, null: false
    t.string "remark"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "tax_rate_type", limit: 1, null: false
    t.integer "expense_file_id"
    t.string "invoice_number"
    t.index ["created_by_id"], name: "index_cash_reserves_on_created_by_id"
    t.index ["daily_journal_item_id"], name: "index_cash_reserves_on_daily_journal_item_id"
    t.index ["day", "department_id", "data_type"], name: "index_cash_reserves_on_day_and_department_id_and_data_type"
    t.index ["department_id"], name: "index_cash_reserves_on_department_id"
    t.index ["expense_file_id"], name: "index_cash_reserves_on_expense_file_id"
    t.index ["updated_by_id"], name: "index_cash_reserves_on_updated_by_id"
  end

  create_table "chain_store_prescriptions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "prescription_count"
    t.integer "dispensing_reward"
    t.integer "medicine_fee"
    t.integer "technical_fee"
    t.integer "dispensing_basic"
    t.integer "dispensing_fee"
    t.integer "dispensing_addition"
    t.integer "non_insurance_amount"
    t.integer "copayment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_chain_store_prescriptions_on_created_by_id"
    t.index ["day", "department_id"], name: "index_chain_store_prescriptions", unique: true
    t.index ["department_id"], name: "index_chain_store_prescriptions_on_department_id"
    t.index ["updated_by_id"], name: "index_chain_store_prescriptions_on_updated_by_id"
  end

  create_table "change_logs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "loggable_type"
    t.integer "loggable_id"
    t.string "value_type", null: false
    t.string "column_name", null: false
    t.string "old_value"
    t.string "new_value"
    t.integer "created_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "transaction_number", null: false
    t.index ["created_at"], name: "index_change_logs_on_created_at"
    t.index ["created_by_id"], name: "index_change_logs_on_created_by_id"
    t.index ["loggable_type", "loggable_id"], name: "index_change_logs_on_loggable_type_and_loggable_id"
    t.index ["transaction_number"], name: "index_change_logs_on_transaction_number"
  end

  create_table "checker_area_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "group_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "job_type", limit: 1, null: false
    t.integer "area_id", null: false
    t.index ["area_id", "job_type"], name: "index_checker_area_groups_on_area_id_and_job_type", unique: true
    t.index ["area_id"], name: "index_checker_area_groups_on_area_id"
    t.index ["group_id"], name: "index_checker_area_groups_on_group_id"
  end

  create_table "chief_report_changes", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "chief_report_id", null: false
    t.integer "department_id", null: false
    t.date "dated_on", null: false
    t.integer "key", limit: 1, null: false
    t.string "value"
    t.string "before_value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "comment"
    t.index ["chief_report_id"], name: "index_chief_report_changes_on_chief_report_id"
    t.index ["department_id"], name: "index_chief_report_changes_on_department_id"
  end

  create_table "chief_report_details", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "chief_report_id", null: false
    t.integer "department_id", null: false
    t.text "regional_issue"
    t.text "regional_comment"
    t.text "generic_issue"
    t.text "generic_comment"
    t.text "benefit_comment"
    t.text "department_issue"
    t.text "department_comment"
    t.text "other_comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "benefit_issue"
    t.index ["chief_report_id", "department_id"], name: "index_chief_report_details_on_chief_report_id_and_department_id", unique: true
    t.index ["chief_report_id"], name: "index_chief_report_details_on_chief_report_id"
    t.index ["department_id"], name: "index_chief_report_details_on_department_id"
  end

  create_table "chief_report_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "chief_report_id", null: false
    t.integer "user_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["chief_report_id"], name: "index_chief_report_users_on_chief_report_id"
    t.index ["user_id"], name: "index_chief_report_users_on_user_id"
  end

  create_table "chief_reports", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "dated_on", null: false
    t.text "management_issue"
    t.text "management_comment"
    t.text "operation_issue"
    t.text "operation_comment"
    t.text "manager_day_reason"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_chief_reports_on_created_by_id"
    t.index ["updated_by_id"], name: "index_chief_reports_on_updated_by_id"
  end

  create_table "ckeditor_assets", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "clinical_departments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "short_name"
    t.integer "sort_order", default: 0, null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_clinical_departments_on_code", unique: true
  end

  create_table "commuting_routes", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shop_id"
    t.string "start_station"
    t.string "dest_station"
    t.integer "amount"
    t.integer "means"
    t.string "route_line"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "start_route_line"
    t.string "dest_route_line"
    t.integer "route_type"
    t.string "comment"
    t.integer "author_id"
    t.float "distance"
    t.index ["shop_id"], name: "index_commuting_routes_on_shop_id"
    t.index ["user_id"], name: "index_commuting_routes_on_user_id"
  end

  create_table "commuting_times", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "department_id", null: false
    t.integer "required_time"
    t.integer "distance"
    t.text "resource_uri", size: :medium
    t.integer "means", limit: 1, null: false
    t.integer "server_type", limit: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id"], name: "index_commuting_times_on_department_id"
    t.index ["user_id", "department_id", "means"], name: "index_commuting_times_on_user_id_and_department_id_and_means", unique: true
    t.index ["user_id"], name: "index_commuting_times_on_user_id"
  end

  create_table "companies", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hidden", default: false
    t.boolean "countable_roster", default: true, null: false
    t.integer "section", limit: 1
    t.integer "deadline", limit: 1, default: 1, null: false
    t.boolean "paying", default: false
    t.string "seal_location"
    t.integer "parent_id"
    t.integer "business_segment", limit: 1
    t.boolean "cb", default: false, null: false
    t.integer "document_representative_id"
    t.integer "member_type", limit: 1, default: 0
    t.integer "code_from_ebond"
    t.string "invoice_registration_number"
    t.index ["code"], name: "index_companies_on_code", unique: true
    t.index ["document_representative_id"], name: "index_companies_on_document_representative_id"
    t.index ["parent_id"], name: "index_companies_on_parent_id"
  end

  create_table "company_bank_accounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id"
    t.integer "department_id"
    t.integer "accounting_item_id"
    t.string "bank_code"
    t.string "bank_name"
    t.string "bank_kana"
    t.string "branch_code"
    t.string "branch_name"
    t.string "branch_kana"
    t.integer "deposit_type"
    t.string "account_number"
    t.string "account_name"
    t.string "account_kana"
    t.integer "client_deposit_type"
    t.string "client_code"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "tax_type"
    t.integer "tax_autocalc"
    t.string "client_name"
    t.integer "accounting_item2_id"
    t.index ["accounting_item_id"], name: "index_company_bank_accounts_on_accounting_item_id"
    t.index ["company_id"], name: "index_company_bank_accounts_on_company_id"
    t.index ["department_id"], name: "index_company_bank_accounts_on_department_id"
  end

  create_table "company_housings", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.date "date_from"
    t.date "date_to"
    t.string "zip"
    t.integer "prefecture", limit: 1
    t.string "municipality"
    t.string "house_number"
    t.integer "contractor_id"
    t.integer "contractor_dep_id"
    t.integer "cohabitant_id"
    t.integer "cohabitant_dep_id"
    t.string "bank_code"
    t.string "bank_name"
    t.string "branch_code"
    t.string "branch_name"
    t.integer "deposit_type", limit: 1
    t.string "account_name"
    t.string "account_number"
    t.integer "rent"
    t.integer "common_charge"
    t.integer "parking_fee"
    t.integer "env_maintenance_fee"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type", limit: 1, default: 1, null: false
    t.integer "contract_type", limit: 1, null: false
    t.integer "rental_type", limit: 1
    t.integer "renewal_fee"
    t.integer "staff_id"
    t.string "target_section"
    t.float "target_area"
    t.integer "rent_tax_type", limit: 1
    t.integer "charge_tax_type", limit: 1
    t.integer "tenant_fee"
    t.integer "tenant_tax_type", limit: 1
    t.integer "promotion_fee"
    t.integer "promotion_tax_type", limit: 1
    t.integer "copayment"
    t.integer "key_money"
    t.integer "deposit"
    t.string "deposit_amortization"
    t.string "deposit_amortization_timing"
    t.integer "guarantee"
    t.string "guarantee_amortization"
    t.string "guarantee_amortization_timing"
    t.integer "other_initial_cost"
    t.string "initial_cost_comment"
    t.string "invoice_number"
    t.string "contract_name"
    t.string "contract_tel"
    t.string "cancel_notice_period"
    t.date "cancel_date"
    t.integer "cancel_refund"
    t.integer "contract_document_id"
    t.integer "amortization_on_renewal"
    t.integer "amortization_on_cancel"
    t.decimal "guarantee_fee", precision: 10, scale: 2, default: "0.0"
    t.integer "renewal_fee_commission", comment: "更新手数料"
    t.integer "parking_count", comment: "駐車場台数"
    t.integer "other_amount", comment: "その他金額"
    t.text "remarks", comment: "備考"
    t.string "hmb_bugyo_attribution", comment: "HMB奉行帰属"
    t.index ["cohabitant_dep_id"], name: "index_company_housings_on_cohabitant_dep_id"
    t.index ["cohabitant_id"], name: "index_company_housings_on_cohabitant_id"
    t.index ["contract_document_id"], name: "index_company_housings_on_contract_document_id"
    t.index ["contractor_dep_id"], name: "index_company_housings_on_contractor_dep_id"
    t.index ["contractor_id"], name: "index_company_housings_on_contractor_id"
    t.index ["created_by_id"], name: "index_company_housings_on_created_by_id"
    t.index ["staff_id"], name: "index_company_housings_on_staff_id"
    t.index ["updated_by_id"], name: "index_company_housings_on_updated_by_id"
  end

  create_table "company_registrations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id", null: false
    t.date "dated_on", null: false
    t.integer "code", limit: 1, null: false
    t.string "value", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["company_id", "dated_on", "code"], name: "index_company_registrations_on_company_id_and_dated_on_and_code", unique: true
    t.index ["company_id"], name: "index_company_registrations_on_company_id"
    t.index ["updated_by_id"], name: "index_company_registrations_on_updated_by_id"
  end

  create_table "company_representatives", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "representative_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type", default: 1, null: false
    t.date "dated_on", null: false
    t.integer "updated_by_id"
    t.integer "alter_type", limit: 1, default: 1, null: false
    t.index ["company_id", "representative_id", "dated_on", "data_type"], name: "company_repr_date_type_index", unique: true
    t.index ["company_id"], name: "index_company_representatives_on_company_id"
    t.index ["representative_id"], name: "index_company_representatives_on_representative_id"
    t.index ["updated_by_id"], name: "index_company_representatives_on_updated_by_id"
  end

  create_table "concerned_customers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "user_id"
    t.boolean "hidden", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_concerned_customers_on_user_id"
  end

  create_table "concerned_shops", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "user_id"
    t.boolean "hidden", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_concerned_shops_on_user_id"
  end

  create_table "contract_documents", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.date "agreement_date"
    t.date "start_date"
    t.date "end_date"
    t.boolean "renew", default: false, null: false
    t.integer "renewed_years"
    t.integer "stored_place"
    t.string "party_1"
    t.string "party_2"
    t.string "party_3"
    t.string "party_4"
    t.text "special_note", size: :medium
    t.boolean "memorandum", default: false, null: false
    t.integer "department_id"
    t.text "remark_1", size: :medium
    t.text "remark_2", size: :medium
    t.integer "parent_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "contract_type_id", null: false
    t.boolean "legal_affair_check", default: false
    t.integer "business_connection_id", comment: "取引先（支払先）"
    t.index ["business_connection_id"], name: "index_contract_documents_on_business_connection_id"
    t.index ["contract_type_id"], name: "index_contract_documents_on_contract_type_id"
    t.index ["created_by_id"], name: "index_contract_documents_on_created_by_id"
    t.index ["department_id"], name: "index_contract_documents_on_department_id"
    t.index ["parent_id"], name: "index_contract_documents_on_parent_id"
    t.index ["updated_by_id"], name: "index_contract_documents_on_updated_by_id"
  end

  create_table "contract_type_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "contract_type_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["contract_type_id", "group_id"], name: "index_contract_type_groups_on_contract_type_id_and_group_id", unique: true
    t.index ["contract_type_id"], name: "index_contract_type_groups_on_contract_type_id"
    t.index ["group_id"], name: "index_contract_type_groups_on_group_id"
  end

  create_table "contract_type_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "contract_type_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["contract_type_id", "user_id"], name: "index_contract_type_users_on_contract_type_id_and_user_id", unique: true
    t.index ["contract_type_id"], name: "index_contract_type_users_on_contract_type_id"
    t.index ["user_id"], name: "index_contract_type_users_on_user_id"
  end

  create_table "contract_types", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "auth_type", limit: 1, default: 1, null: false
    t.index ["code"], name: "index_contract_types_on_code", unique: true
  end

  create_table "copayment_adjust_details", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "item_seq", null: false
    t.string "item_name"
    t.string "patient_name", null: false
    t.integer "amount", default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type", limit: 1
    t.date "collect_date"
    t.integer "collect_amount"
    t.boolean "collected", default: false, null: false
    t.string "reason"
    t.integer "receivable_id"
    t.index ["created_by_id"], name: "index_copayment_adjust_details_on_created_by_id"
    t.index ["day", "department_id", "item_seq"], name: "copayment_adjust_details_index", unique: true
    t.index ["department_id"], name: "index_copayment_adjust_details_on_department_id"
    t.index ["receivable_id"], name: "index_copayment_adjust_details_on_receivable_id"
    t.index ["updated_by_id"], name: "index_copayment_adjust_details_on_updated_by_id"
  end

  create_table "daily_cash_summaries", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "sales_in_store", default: 0, null: false
    t.integer "petty_balance", default: 0, null: false
    t.integer "purchase_balance", default: 0, null: false
    t.integer "safe_exchange", default: 0, null: false
    t.integer "register_exchange", default: 0, null: false
    t.integer "difference", default: 0, null: false
    t.integer "previous_sales_in_store", default: 0, null: false
    t.integer "previous_petty_balance", default: 0, null: false
    t.integer "previous_purchase_balance", default: 0, null: false
    t.integer "previous_safe_exchange", default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hidden", default: false, null: false
    t.index ["created_by_id"], name: "index_daily_cash_summaries_on_created_by_id"
    t.index ["day", "department_id"], name: "index_daily_cash_summaries_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_daily_cash_summaries_on_department_id"
    t.index ["updated_by_id"], name: "index_daily_cash_summaries_on_updated_by_id"
  end

  create_table "daily_closings", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "prescription_count", default: 0, null: false
    t.integer "dispensing_reward", default: 0, null: false
    t.integer "technical_fee", default: 0, null: false
    t.integer "medicine_fee", default: 0, null: false
    t.integer "copayment_health_ins", default: 0, null: false
    t.integer "copayment_care_ins", default: 0, null: false
    t.integer "medicine_sales", default: 0, null: false
    t.integer "container_cost", default: 0, null: false
    t.integer "otc_sales_base", default: 0, null: false
    t.integer "otc_sales_tax", default: 0, null: false
    t.integer "register_exchange", default: 0, null: false
    t.integer "money_10000_count", default: 0, null: false
    t.integer "money_5000_count", default: 0, null: false
    t.integer "money_2000_count", default: 0, null: false
    t.integer "money_1000_count", default: 0, null: false
    t.integer "money_500_count", default: 0, null: false
    t.integer "money_100_count", default: 0, null: false
    t.integer "money_50_count", default: 0, null: false
    t.integer "money_10_count", default: 0, null: false
    t.integer "money_5_count", default: 0, null: false
    t.integer "money_1_count", default: 0, null: false
    t.string "message"
    t.string "reason_of_difference"
    t.integer "confirmed_by_id"
    t.integer "input_by_id"
    t.boolean "fixed", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "otc_sales_base_reduced", default: 0, null: false
    t.integer "otc_sales_tax_reduced", default: 0, null: false
    t.integer "send_fee_return", default: 0, null: false
    t.integer "prescription_clinic_count", default: 0, null: false
    t.integer "prescription_home_count", default: 0, null: false
    t.integer "timerecord_input_by_id"
    t.integer "care_insurance", default: 0, null: false
    t.integer "otc_sales_duty_free", default: 0, null: false
    t.integer "technical_fee_at_home", default: 0, null: false
    t.integer "medicine_fee_at_home", default: 0, null: false
    t.integer "reibai_sales", default: 0, null: false
    t.integer "selected_treatment_fee", default: 0, null: false
    t.integer "pharmacy_tax_fee", default: 0, null: false
    t.datetime "fixed_at", precision: nil
    t.datetime "confirmed_at", precision: nil
    t.integer "finally_approved_by_id"
    t.datetime "finally_approved_at", precision: nil
    t.boolean "bugyo_synced", default: false, null: false
    t.integer "counted_by_id"
    t.integer "count_checked_by_id"
    t.index ["confirmed_by_id"], name: "index_daily_closings_on_confirmed_by_id"
    t.index ["count_checked_by_id"], name: "index_daily_closings_on_count_checked_by_id"
    t.index ["counted_by_id"], name: "index_daily_closings_on_counted_by_id"
    t.index ["created_by_id"], name: "index_daily_closings_on_created_by_id"
    t.index ["day", "department_id"], name: "index_daily_closings_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_daily_closings_on_department_id"
    t.index ["finally_approved_by_id"], name: "index_daily_closings_on_finally_approved_by_id"
    t.index ["input_by_id"], name: "index_daily_closings_on_input_by_id"
    t.index ["timerecord_input_by_id"], name: "index_daily_closings_on_timerecord_input_by_id"
    t.index ["updated_by_id"], name: "index_daily_closings_on_updated_by_id"
  end

  create_table "daily_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.text "text", null: false
    t.integer "comment_type", limit: 1, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_daily_comments_on_created_by_id"
    t.index ["day", "comment_type"], name: "index_daily_comments_on_day_and_comment_type", unique: true
    t.index ["updated_by_id"], name: "index_daily_comments_on_updated_by_id"
  end

  create_table "daily_journal_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", null: false
    t.integer "company_id"
    t.integer "data_type", null: false
    t.integer "item_seq", null: false
    t.string "remark", null: false
    t.string "debit_code"
    t.string "debit_sub_code"
    t.integer "debit_tax_type"
    t.integer "debit_tax_autocalc"
    t.string "credit_code"
    t.string "credit_sub_code"
    t.integer "credit_tax_type"
    t.integer "credit_tax_autocalc"
    t.boolean "is_payment", default: true, null: false
    t.boolean "labeled", default: true, null: false
    t.boolean "bugyo_sync", default: true, null: false
    t.string "summary_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "default_tax_rate", limit: 1, default: 0, null: false
    t.boolean "tax_rate_changeable", default: false, null: false
    t.boolean "invoice_check", default: true
    t.integer "invoice_border"
    t.boolean "invoice_special_ledgery", default: false
    t.integer "rank", default: 0
    t.index ["code"], name: "index_daily_journal_items_on_code", unique: true
    t.index ["company_id"], name: "index_daily_journal_items_on_company_id"
  end

  create_table "daily_sales_confirms", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "sales", default: 0, null: false
    t.boolean "confirmed", default: false, null: false
    t.date "deposit_on"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_daily_sales_confirms_on_created_by_id"
    t.index ["day", "department_id"], name: "index_daily_sales_confirms_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_daily_sales_confirms_on_department_id"
    t.index ["updated_by_id"], name: "index_daily_sales_confirms_on_updated_by_id"
  end

  create_table "delayed_job_logs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "job_name", null: false
    t.datetime "executed_at", precision: nil
    t.boolean "success", default: false, null: false
    t.text "error"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "delayed_jobs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", size: :medium, null: false
    t.text "last_error", size: :medium
    t.datetime "run_at", precision: nil
    t.datetime "locked_at", precision: nil
    t.datetime "failed_at", precision: nil
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "department_additions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.text "line_of_business", size: :medium
    t.boolean "available_otc"
    t.boolean "available_first_class"
    t.boolean "available_second_class"
    t.boolean "available_designated_second"
    t.boolean "available_third_class"
    t.boolean "available_pharmacist_instruction"
    t.boolean "available_specific_sales"
    t.string "pharmacy_permit_number"
    t.string "medical_institution_code"
    t.string "toxic_substance"
    t.string "advanced_medical"
    t.string "narcotics"
    t.string "industrial_accident_insurance"
    t.boolean "dispensing_basic"
    t.integer "dispensing_basic_value", limit: 3
    t.string "dispensing_basic_number", limit: 64
    t.date "dispensing_basic_date"
    t.boolean "generic_addition"
    t.integer "generic_addition_value", limit: 3
    t.string "generic_addition_number", limit: 64
    t.date "generic_addition_date"
    t.integer "family_pharmacist", limit: 1
    t.string "family_pharmacist_number", limit: 64
    t.date "family_pharmacist_date"
    t.integer "dispensing_addition_value", limit: 1
    t.string "dispensing_addition_number", limit: 64
    t.date "dispensing_addition_date"
    t.boolean "tuberculosis"
    t.boolean "nuclear_victims"
    t.boolean "japan_pharma_assoc"
    t.integer "japan_pharma_assoc_fee"
    t.boolean "pref_pharma_assoc"
    t.integer "pref_pharma_assoc_fee"
    t.boolean "mun_pharma_assoc"
    t.integer "mun_pharma_assoc_fee"
    t.string "mun_pharma_assoc_name"
    t.text "local_community_activities", size: :medium
    t.string "insurance_company"
    t.string "insurance_staff"
    t.string "insurance_contact"
    t.string "insurance_plan"
    t.string "insurance_policy_number"
    t.integer "insurance_period"
    t.date "insurance_start_date"
    t.date "insurance_expiry_date"
    t.boolean "support_rehabilitation"
    t.boolean "support_mental_hospital"
    t.boolean "life_insurance"
    t.boolean "orphans_from_china"
    t.boolean "infection"
    t.boolean "pediatric_chronic"
    t.boolean "specified_diseases"
    t.string "incurable_diseases_pharma"
    t.string "incurable_diseases_period"
    t.boolean "hepatitis"
    t.boolean "ritalin"
    t.boolean "concerta"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "strategy", size: :medium
    t.integer "dispensing_addition_status", limit: 1
    t.string "high_risk_addition_number", limit: 64
    t.date "high_risk_addition_date"
    t.float "concentration_rate"
    t.float "generic_rate"
    t.string "care_institution_code"
    t.date "pharmacy_permit_date_from"
    t.date "pharmacy_permit_date_to"
    t.date "toxic_substance_date_from"
    t.date "toxic_substance_date_to"
    t.date "advanced_medical_date_from"
    t.date "advanced_medical_date_to"
    t.string "online_guide_addition_number", limit: 64
    t.date "online_guide_addition_date"
    t.string "home_dispensing_addition_number", limit: 64
    t.date "home_dispensing_addition_date"
    t.string "home_pharmacy_management_number", limit: 64
    t.date "home_pharmacy_management_date"
    t.string "continuous_infusion_number", limit: 64
    t.date "continuous_infusion_date"
    t.string "parenteral_nutrition_number", limit: 64
    t.date "parenteral_nutrition_date"
    t.string "sterile_preparation_number", limit: 64
    t.date "sterile_preparation_date"
    t.string "closer_cooperation_number", limit: 64
    t.date "closer_cooperation_date"
    t.integer "home_pharmacy_comprehensive_value", limit: 3
    t.string "home_pharmacy_comprehensive_number", limit: 64
    t.date "home_pharmacy_comprehensive_date"
    t.string "medical_dx_promotion_number", limit: 64
    t.date "medical_dx_promotion_date"
    t.integer "medical_dx_promotion_value", limit: 1
    t.index ["department_id"], name: "index_department_additions_on_department_id"
  end

  create_table "department_area_infos", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "area_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["area_id"], name: "index_department_area_infos_on_area_id"
    t.index ["day", "department_id"], name: "index_department_area_infos_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_department_area_infos_on_department_id"
  end

  create_table "department_bank_account_balances", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_bank_account_id"
    t.date "month_end_date"
    t.bigint "balance"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_bank_account_id"], name: "idx_dept_bank_acc_bal_on_dept_bank_acc_id"
  end

  create_table "department_bank_accounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id"
    t.integer "company_id"
    t.string "type1"
    t.string "bank_name"
    t.string "branch_name"
    t.string "account_type"
    t.string "account_number"
    t.string "representative_name"
    t.string "bugyo_department_code"
    t.string "bugyo_item_code"
    t.string "bugyo_sub_item_code"
    t.text "remarks"
    t.string "movable_type"
    t.string "purpose_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "bank_code"
    t.string "branch_code"
    t.integer "nearest_department_id"
    t.string "bookkeeping_destination_name"
    t.text "bookkeeping_destination_address"
    t.index ["company_id"], name: "index_department_bank_accounts_on_company_id"
    t.index ["department_id"], name: "index_department_bank_accounts_on_department_id"
    t.index ["nearest_department_id"], name: "index_department_bank_accounts_on_nearest_department_id"
  end

  create_table "department_biz_bank_accounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "business_connection_id", null: false
    t.integer "department_id", null: false
    t.integer "biz_bank_account_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["biz_bank_account_id"], name: "index_department_biz_bank_accounts_on_biz_bank_account_id"
    t.index ["business_connection_id", "department_id"], name: "biz_conn_depts_index", unique: true
    t.index ["business_connection_id"], name: "index_department_biz_bank_accounts_on_business_connection_id"
    t.index ["department_id"], name: "index_department_biz_bank_accounts_on_department_id"
  end

  create_table "department_budgets", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.date "budget_date", null: false
    t.integer "monthly_business_days", default: 0, null: false
    t.integer "prescription_count", default: 0, null: false
    t.integer "shift_count_ph", default: 0, null: false
    t.integer "shift_count_ow", default: 0, null: false
    t.integer "sales", default: 0, null: false
    t.integer "technical_fee", default: 0, null: false
    t.integer "medicine_fee", default: 0, null: false
    t.integer "care_insurance_fee", default: 0, null: false
    t.integer "count_ph", default: 0, null: false
    t.integer "count_ow", default: 0, null: false
    t.integer "labor_cost_ph", default: 0, null: false
    t.integer "labor_cost_ow", default: 0, null: false
    t.integer "rent_cost", default: 0, null: false
    t.integer "other_selling", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id"], name: "index_department_budgets_on_department_id"
  end

  create_table "department_business_connections", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "business_connection_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "accounting_item_id", null: false
    t.date "start_on"
    t.date "end_on"
    t.boolean "having_invoice", default: true
    t.integer "data_type", limit: 1, default: 1, null: false
    t.index ["accounting_item_id"], name: "index_department_business_connections_on_accounting_item_id"
    t.index ["business_connection_id"], name: "index_department_business_connections_on_business_connection_id"
    t.index ["department_id", "business_connection_id", "accounting_item_id", "data_type"], name: "index_dept_biz_conn_on_dept_biz_acct", unique: true
    t.index ["department_id"], name: "index_department_business_connections_on_department_id"
  end

  create_table "department_constants", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.date "applied_on", null: false
    t.integer "constant_ph"
    t.integer "constant_ow"
    t.integer "constant_ph_sun"
    t.integer "constant_ph_mon"
    t.integer "constant_ph_tue"
    t.integer "constant_ph_wed"
    t.integer "constant_ph_thu"
    t.integer "constant_ph_fri"
    t.integer "constant_ph_sat"
    t.integer "constant_ow_sun"
    t.integer "constant_ow_mon"
    t.integer "constant_ow_tue"
    t.integer "constant_ow_wed"
    t.integer "constant_ow_thu"
    t.integer "constant_ow_fri"
    t.integer "constant_ow_sat"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id", "applied_on"], name: "index_department_constants_on_department_id_and_applied_on", unique: true
    t.index ["department_id"], name: "index_department_constants_on_department_id"
  end

  create_table "department_count_rules", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.date "applied_on", null: false
    t.integer "required_p_count"
    t.boolean "large_hospital", default: false, null: false
    t.integer "in_home_count"
    t.integer "fluctuate_ph_count"
    t.boolean "extrality", default: false, null: false
    t.integer "addition_ph_sun"
    t.integer "addition_ph_mon"
    t.integer "addition_ph_tue"
    t.integer "addition_ph_wed"
    t.integer "addition_ph_thu"
    t.integer "addition_ph_fri"
    t.integer "addition_ph_sat"
    t.string "addition_comment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "remote_entry"
    t.boolean "zero_office_worker"
    t.integer "business_plus_alpha"
    t.integer "addition_ow_mon"
    t.integer "addition_ow_tue"
    t.integer "addition_ow_wed"
    t.integer "addition_ow_thu"
    t.integer "addition_ow_sun"
    t.integer "addition_ow_fri"
    t.integer "addition_ow_sat"
    t.string "comment"
    t.string "fluctuate_comment"
    t.integer "fluctuate_ow_count"
    t.index ["created_by_id"], name: "index_department_count_rules_on_created_by_id"
    t.index ["department_id", "applied_on"], name: "index_department_count_rules_on_department_id_and_applied_on", unique: true
    t.index ["department_id"], name: "index_department_count_rules_on_department_id"
    t.index ["updated_by_id"], name: "index_department_count_rules_on_updated_by_id"
  end

  create_table "department_display_types", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_department_display_types_on_code", unique: true
  end

  create_table "department_monthly_reports", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.date "month", null: false
    t.json "value", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id", "data_type", "month"], name: "department_monthly_reports_index", unique: true
    t.index ["department_id"], name: "index_department_monthly_reports_on_department_id"
  end

  create_table "department_pharmacists", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id", "data_type", "user_id"], name: "department_pharmacists_index", unique: true
    t.index ["department_id"], name: "index_department_pharmacists_on_department_id"
    t.index ["user_id"], name: "index_department_pharmacists_on_user_id"
  end

  create_table "department_uniform_numbers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "uniform_number_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "dated_on", null: false
    t.index ["department_id", "uniform_number_id", "dated_on"], name: "department_uniform_numbers_index", unique: true
    t.index ["department_id"], name: "index_department_uniform_numbers_on_department_id"
    t.index ["uniform_number_id"], name: "index_department_uniform_numbers_on_uniform_number_id"
  end

  create_table "departments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id"
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hidden", default: false
    t.integer "data_type", default: 1
    t.string "store_code"
    t.string "store_name"
    t.integer "kkb_id"
    t.string "store_kana"
    t.string "kana"
    t.string "shift_number1"
    t.string "shift_number2"
    t.date "start_day_count"
    t.date "finish_day_count"
    t.integer "chief_id"
    t.boolean "hidden_shift_table", default: false, null: false
    t.string "comment"
    t.string "formal_name"
    t.string "formal_kana"
    t.string "zip"
    t.string "prefecture"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "tel"
    t.string "fax"
    t.string "email"
    t.string "mobile_tel"
    t.string "mobile_email"
    t.text "google_map", size: :medium
    t.string "photo"
    t.boolean "openness", default: true, null: false
    t.integer "login_user_id"
    t.integer "edit_user_id"
    t.integer "numbers_area", limit: 1
    t.string "email2"
    t.string "email3"
    t.string "email4"
    t.boolean "enable_numbers", default: true, null: false
    t.date "opening_date"
    t.date "closing_date"
    t.integer "destination_id"
    t.integer "chief2_id"
    t.integer "shift_count_ph", default: 0, null: false
    t.integer "shift_count_ow", default: 0, null: false
    t.integer "company2_id"
    t.integer "location_address_id"
    t.integer "location_station_id"
    t.integer "section", limit: 1
    t.integer "representative_id"
    t.integer "element_leader_id"
    t.boolean "set_rest_time_sun", default: false, null: false
    t.boolean "set_rest_time_mon", default: false, null: false
    t.boolean "set_rest_time_tue", default: false, null: false
    t.boolean "set_rest_time_wed", default: false, null: false
    t.boolean "set_rest_time_thu", default: false, null: false
    t.boolean "set_rest_time_fri", default: false, null: false
    t.boolean "set_rest_time_sat", default: false, null: false
    t.string "map_motivation_number"
    t.string "plan_number"
    t.string "registration_note"
    t.date "last_registered_date"
    t.integer "secondary_id"
    t.integer "tertiary_id"
    t.string "health_care_center"
    t.string "shift_shared_info"
    t.integer "shift_plan_ph", default: 0, null: false
    t.integer "shift_plan_ow", default: 0, null: false
    t.integer "shop_scheme", limit: 1
    t.integer "display_type_id"
    t.integer "home_care_status", limit: 1
    t.integer "parent_id"
    t.decimal "distance_from_station", precision: 3, scale: 1
    t.string "time_from_station"
    t.text "route_from_station"
    t.boolean "observe_guide", default: false, null: false
    t.boolean "commutable_by_car"
    t.integer "ranking", default: 0, null: false
    t.integer "fire_manager_id"
    t.integer "daily_journal_type", limit: 1, default: 0
    t.string "monitor_camera1_url"
    t.string "monitor_camera2_url"
    t.integer "user_segment_id"
    t.index ["chief2_id"], name: "index_departments_on_chief2_id"
    t.index ["chief_id"], name: "index_departments_on_chief_id"
    t.index ["code"], name: "index_departments_on_code_unique", unique: true
    t.index ["company2_id"], name: "index_departments_on_company2_id"
    t.index ["company_id"], name: "index_departments_on_company_id"
    t.index ["destination_id"], name: "index_departments_on_destination_id"
    t.index ["display_type_id"], name: "index_departments_on_display_type_id"
    t.index ["edit_user_id"], name: "index_departments_on_edit_user_id"
    t.index ["element_leader_id"], name: "index_departments_on_element_leader_id"
    t.index ["fire_manager_id"], name: "index_departments_on_fire_manager_id"
    t.index ["kkb_id"], name: "index_departments_on_kkb_id"
    t.index ["location_address_id"], name: "index_departments_on_location_address_id"
    t.index ["location_station_id"], name: "index_departments_on_location_station_id"
    t.index ["login_user_id"], name: "index_departments_on_login_user_id"
    t.index ["parent_id"], name: "index_departments_on_parent_id"
    t.index ["representative_id"], name: "index_departments_on_representative_id"
    t.index ["secondary_id"], name: "index_departments_on_secondary_id"
    t.index ["store_code"], name: "index_departments_on_store_code_unique", unique: true
    t.index ["tertiary_id"], name: "index_departments_on_tertiary_id"
    t.index ["user_segment_id"], name: "index_departments_on_user_segment_id"
  end

  create_table "deployments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.boolean "hidden", default: false, null: false
    t.integer "department_id"
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_deployments_on_code", unique: true
    t.index ["created_by_id"], name: "index_deployments_on_created_by_id"
    t.index ["department_id"], name: "index_deployments_on_department_id"
    t.index ["updated_by_id"], name: "index_deployments_on_updated_by_id"
  end

  create_table "deposit_histories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "deposit", default: 0, null: false
    t.integer "user_id", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_deposit_histories_on_created_by_id"
    t.index ["day", "department_id"], name: "index_deposit_histories_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_deposit_histories_on_department_id"
    t.index ["updated_by_id"], name: "index_deposit_histories_on_updated_by_id"
    t.index ["user_id"], name: "index_deposit_histories_on_user_id"
  end

  create_table "destinations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.integer "dest_type", limit: 1, null: false
    t.date "started_on"
    t.date "ended_on"
    t.boolean "hidden", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "rank"
  end

  create_table "division_infos", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id"
    t.string "code"
    t.string "name"
    t.string "sub_code"
    t.string "sub_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hidden", default: false
    t.index ["company_id", "code", "sub_code"], name: "index_division_infos_on_company_id_and_code_and_sub_code", unique: true
    t.index ["company_id"], name: "index_division_infos_on_company_id"
  end

  create_table "early_work_hours", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "department_id", null: false
    t.date "day", null: false
    t.time "start_time"
    t.string "status", default: "submitted", null: false
    t.text "comment"
    t.integer "approver_id"
    t.datetime "approved_at", precision: nil
    t.integer "creator_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["approver_id"], name: "index_early_work_hours_on_approver_id"
    t.index ["creator_id"], name: "index_early_work_hours_on_creator_id"
    t.index ["day", "user_id"], name: "idx_cwh_on_day_user"
    t.index ["department_id"], name: "index_early_work_hours_on_department_id"
    t.index ["status"], name: "index_early_work_hours_on_status"
    t.index ["user_id"], name: "index_early_work_hours_on_user_id"
  end

  create_table "ekispert_keys", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "access_key"
    t.integer "key_type", limit: 1, null: false
    t.integer "limit_count"
    t.integer "access_count", default: 0, null: false
    t.boolean "available", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["access_key"], name: "index_ekispert_keys_on_access_key", unique: true
  end

  create_table "event_detail_instructions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "event_detail_id", null: false
    t.integer "instruction_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["event_detail_id", "instruction_id"], name: "event_detail_instructions_index", unique: true
    t.index ["event_detail_id"], name: "index_event_detail_instructions_on_event_detail_id"
    t.index ["instruction_id"], name: "index_event_detail_instructions_on_instruction_id"
  end

  create_table "event_details", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "event_header_id", null: false
    t.integer "sort_order", default: 1, null: false
    t.date "dated_on"
    t.integer "user_id"
    t.integer "department_id"
    t.integer "former_department_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "activity"
    t.integer "row_number", default: 1, null: false
    t.integer "col_number", default: 1, null: false
    t.integer "organization_unit_id"
    t.text "line_path"
    t.index ["created_by_id"], name: "index_event_details_on_created_by_id"
    t.index ["department_id"], name: "index_event_details_on_department_id"
    t.index ["event_header_id"], name: "index_event_details_on_event_header_id"
    t.index ["former_department_id"], name: "index_event_details_on_former_department_id"
    t.index ["organization_unit_id"], name: "index_event_details_on_organization_unit_id"
    t.index ["updated_by_id"], name: "index_event_details_on_updated_by_id"
    t.index ["user_id"], name: "index_event_details_on_user_id"
  end

  create_table "event_headers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "dated_on"
    t.string "description"
    t.integer "status", limit: 1
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_event_headers_on_created_by_id"
    t.index ["updated_by_id"], name: "index_event_headers_on_updated_by_id"
  end

  create_table "exchange_settings", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "register_exchange", default: 0, null: false
    t.integer "safe_exchange", default: 0, null: false
    t.integer "difference", default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "sales_in_store", default: 0, null: false
    t.integer "petty_balance", default: 0, null: false
    t.integer "purchase_balance", default: 0, null: false
    t.boolean "enable_daily_closing", default: true, null: false
    t.integer "technical_fee_rate", limit: 1
    t.boolean "message_required", default: false, null: false
    t.string "message_template"
    t.date "applied_on", default: "2000-01-01", null: false
    t.boolean "approval_required", default: true, null: false
    t.index ["created_by_id"], name: "index_exchange_settings_on_created_by_id"
    t.index ["department_id", "applied_on"], name: "index_exchange_settings_on_department_id_and_applied_on", unique: true
    t.index ["department_id"], name: "index_exchange_settings_on_department_id"
    t.index ["updated_by_id"], name: "index_exchange_settings_on_updated_by_id"
  end

  create_table "exclusive_controls", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "locked_at", precision: nil, null: false
    t.integer "locked_by_id", null: false
    t.index ["locked_by_id"], name: "index_exclusive_controls_on_locked_by_id"
    t.index ["record_type", "record_id"], name: "index_exclusive_controls_on_record_type_and_record_id", unique: true
  end

  create_table "expense_bank_accounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.string "bank_code"
    t.string "bank_name"
    t.string "bank_kana"
    t.string "branch_code"
    t.string "branch_name"
    t.string "branch_kana"
    t.integer "deposit_type"
    t.string "account_number"
    t.string "account_name"
    t.string "account_kana"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "department_id"
    t.boolean "hidden", default: false, null: false
    t.string "accounting_item_code"
    t.string "accounting_item_sub_code"
    t.integer "tax_type"
    t.integer "tax_autocalc"
    t.boolean "credit_card", default: false, null: false
    t.integer "business_connection_id"
    t.index ["business_connection_id"], name: "index_expense_bank_accounts_on_business_connection_id"
    t.index ["department_id"], name: "index_expense_bank_accounts_on_department_id"
  end

  create_table "expense_files", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "dated_from", null: false
    t.date "dated_to", null: false
    t.integer "amount", null: false
    t.integer "expense_type", limit: 1, null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.integer "user_id"
    t.integer "department_id"
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "business_connection_id"
    t.string "new_business_connection_name"
    t.string "invoice_number"
    t.index ["business_connection_id"], name: "index_expense_files_on_business_connection_id"
    t.index ["department_id"], name: "index_expense_files_on_department_id"
    t.index ["updated_by_id"], name: "index_expense_files_on_updated_by_id"
    t.index ["user_id"], name: "index_expense_files_on_user_id"
  end

  create_table "expense_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id"
    t.string "code"
    t.string "name"
    t.integer "accounting_item_id"
    t.text "remark", size: :medium
    t.integer "tax_type"
    t.integer "tax_autocalc"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hidden", default: false
    t.integer "data_type"
    t.boolean "exist_receipt", default: false
    t.integer "expense_type", limit: 1, default: 1, null: false
    t.integer "proc_type", limit: 1
    t.boolean "output_flag", default: true, null: false
    t.integer "tax_rate", limit: 1, default: 0, null: false
    t.boolean "invoice_check", default: true
    t.integer "invoice_border"
    t.boolean "invoice_special_ledgery", default: false
    t.integer "rank", default: 0
    t.boolean "advance_payment", default: false, null: false
    t.index ["accounting_item_id"], name: "index_expense_items_on_accounting_item_id"
    t.index ["company_id"], name: "index_expense_items_on_company_id"
    t.index ["expense_type", "company_id", "code"], name: "idx_expense_type_company_code", unique: true
  end

  create_table "file_record_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "file_record_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["file_record_id", "group_id"], name: "index_file_record_groups_on_file_record_id_and_group_id", unique: true
    t.index ["file_record_id"], name: "index_file_record_groups_on_file_record_id"
    t.index ["group_id"], name: "index_file_record_groups_on_group_id"
  end

  create_table "file_record_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "file_record_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["file_record_id", "user_id"], name: "index_file_record_users_on_file_record_id_and_user_id", unique: true
    t.index ["file_record_id"], name: "index_file_record_users_on_file_record_id"
    t.index ["user_id"], name: "index_file_record_users_on_user_id"
  end

  create_table "file_records", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.boolean "openness", default: false, null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.integer "rank", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_file_records_on_created_by_id"
    t.index ["key"], name: "index_file_records_on_key", unique: true
    t.index ["updated_by_id"], name: "index_file_records_on_updated_by_id"
  end

  create_table "formats", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.integer "department_id", null: false
    t.integer "rank"
    t.boolean "hidden", default: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_formats_on_created_by_id"
    t.index ["department_id"], name: "index_formats_on_department_id"
    t.index ["rank"], name: "index_formats_on_rank"
    t.index ["updated_by_id"], name: "index_formats_on_updated_by_id"
  end

  create_table "func_defs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "args"
    t.boolean "hidden", default: false, null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "func_name", limit: 1, null: false
    t.index ["updated_by_id"], name: "index_func_defs_on_updated_by_id"
  end

  create_table "gen_calendar_dests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "destination_id"
    t.integer "schedule_type", limit: 1, null: false
    t.string "comment"
    t.boolean "sun", default: false, null: false
    t.boolean "mon", default: false, null: false
    t.boolean "tue", default: false, null: false
    t.boolean "wed", default: false, null: false
    t.boolean "thu", default: false, null: false
    t.boolean "fri", default: false, null: false
    t.boolean "sat", default: false, null: false
    t.boolean "w1", default: false, null: false
    t.boolean "w2", default: false, null: false
    t.boolean "w3", default: false, null: false
    t.boolean "w4", default: false, null: false
    t.boolean "w5", default: false, null: false
    t.date "started_on", null: false
    t.date "ended_on"
    t.boolean "hidden", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "holiday", default: false, null: false
    t.index ["created_by_id"], name: "fk_rails_557801c5f4"
    t.index ["destination_id"], name: "index_gen_calendar_dests_on_destination_id"
    t.index ["updated_by_id"], name: "fk_rails_b9ceb1da50"
  end

  create_table "gen_shift_dests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "destination_id"
    t.integer "job_type", null: false
    t.integer "count", default: 0, null: false
    t.integer "count_p", default: 0, null: false
    t.integer "count_x", default: 0, null: false
    t.integer "count_k", default: 0, null: false
    t.integer "count_f", default: 0, null: false
    t.string "comment"
    t.boolean "sun", default: false, null: false
    t.boolean "mon", default: false, null: false
    t.boolean "tue", default: false, null: false
    t.boolean "wed", default: false, null: false
    t.boolean "thu", default: false, null: false
    t.boolean "fri", default: false, null: false
    t.boolean "sat", default: false, null: false
    t.boolean "w1", default: false, null: false
    t.boolean "w2", default: false, null: false
    t.boolean "w3", default: false, null: false
    t.boolean "w4", default: false, null: false
    t.boolean "w5", default: false, null: false
    t.date "started_on", null: false
    t.date "ended_on"
    t.boolean "hidden", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "count_c", default: 0, null: false
    t.integer "count_half", default: 0, null: false
    t.integer "count_h", default: 0, null: false
    t.boolean "holiday", default: false, null: false
    t.index ["created_by_id"], name: "fk_rails_4ace8de287"
    t.index ["destination_id"], name: "index_gen_shift_dests_on_destination_id"
    t.index ["updated_by_id"], name: "fk_rails_60170da7ad"
  end

  create_table "gen_shift_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "destination_id"
    t.integer "roster_type", limit: 1, null: false
    t.string "comment"
    t.boolean "sun"
    t.boolean "mon"
    t.boolean "tue"
    t.boolean "wed"
    t.boolean "thu"
    t.boolean "fri"
    t.boolean "sat"
    t.boolean "w1"
    t.boolean "w2"
    t.boolean "w3"
    t.boolean "w4"
    t.boolean "w5"
    t.date "started_on", null: false
    t.date "ended_on"
    t.boolean "hidden", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "week_span", limit: 1, default: 1, null: false
    t.boolean "enable_week_span", default: false, null: false
    t.boolean "holiday", default: false, null: false
    t.index ["created_by_id"], name: "fk_rails_4597d1559f"
    t.index ["destination_id"], name: "index_gen_shift_users_on_destination_id"
    t.index ["updated_by_id"], name: "fk_rails_5c9cefc355"
    t.index ["user_id"], name: "index_gen_shift_users_on_user_id"
  end

  create_table "global_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "remark"
    t.text "value", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "applied_on"
    t.index ["code", "applied_on"], name: "index_global_values", unique: true
  end

  create_table "google_keys", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "access_key"
    t.integer "key_type", limit: 1, null: false
    t.integer "limit_count"
    t.integer "access_count", default: 0, null: false
    t.boolean "available", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["access_key"], name: "index_google_keys_on_access_key", unique: true
  end

  create_table "greenlines", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "dated_on"
    t.datetime "fixed_at", precision: nil, null: false
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["dated_on"], name: "index_greenlines_on_dated_on", unique: true
    t.index ["updated_by_id"], name: "index_greenlines_on_updated_by_id"
  end

  create_table "group_owners", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id", "user_id"], name: "index_group_owners_on_group_id_and_user_id", unique: true
    t.index ["group_id"], name: "index_group_owners_on_group_id"
    t.index ["user_id"], name: "index_group_owners_on_user_id"
  end

  create_table "group_regions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "region_id", null: false
    t.integer "proc_type", limit: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id", "region_id", "proc_type"], name: "index_group_regions_on_group_id_and_region_id_and_proc_type", unique: true
    t.index ["group_id"], name: "index_group_regions_on_group_id"
    t.index ["region_id"], name: "index_group_regions_on_region_id"
  end

  create_table "group_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id", "user_id"], name: "index_group_users_on_group_id_and_user_id", unique: true
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.text "comment", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.boolean "secret", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.boolean "hidden", default: false, null: false
    t.integer "company_id"
    t.boolean "by_proxy", default: false, null: false
    t.boolean "disappear", default: false
    t.index ["code"], name: "index_groups_on_code", unique: true
    t.index ["company_id"], name: "index_groups_on_company_id"
    t.index ["created_by_id"], name: "index_groups_on_created_by_id"
    t.index ["updated_by_id"], name: "index_groups_on_updated_by_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "haken_shop_messages", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "haken_shop_id"
    t.integer "user_id"
    t.integer "kkb_message_id"
    t.text "content", size: :medium
    t.integer "rank"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["haken_shop_id"], name: "index_haken_shop_messages_on_haken_shop_id"
    t.index ["kkb_message_id"], name: "index_haken_shop_messages_on_kkb_message_id"
    t.index ["user_id"], name: "index_haken_shop_messages_on_user_id"
  end

  create_table "haken_shops", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.text "comment", size: :medium
    t.integer "coma"
    t.integer "area"
    t.boolean "business_sunday"
    t.boolean "business_monday"
    t.boolean "business_tuesday"
    t.boolean "business_wednesday"
    t.boolean "business_thursday"
    t.boolean "business_friday"
    t.boolean "business_saturday"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "address"
    t.string "tel"
    t.date "start_date"
    t.date "finish_date"
    t.boolean "hidden", default: false
    t.integer "rank"
    t.integer "destination_id"
    t.index ["destination_id"], name: "index_haken_shops_on_destination_id"
  end

  create_table "holiday_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "destination_id", null: false
    t.integer "employment"
    t.integer "limit_year"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["destination_id"], name: "index_holiday_categories_on_destination_id"
  end

  create_table "holiday_check_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "user_id", null: false
    t.text "comment", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "legal_holiday_count"
    t.index ["user_id"], name: "index_holiday_check_comments_on_user_id"
    t.index ["year", "user_id"], name: "index_holiday_check_comments_on_year_and_user_id", unique: true
  end

  create_table "holiday_ratios", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "region_id", null: false
    t.date "dated_on", null: false
    t.float "ratio", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_holiday_ratios_on_created_by_id"
    t.index ["dated_on", "region_id"], name: "index_holiday_ratios_on_dated_on_and_region_id", unique: true
    t.index ["region_id"], name: "index_holiday_ratios_on_region_id"
    t.index ["updated_by_id"], name: "index_holiday_ratios_on_updated_by_id"
  end

  create_table "holiday_works", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.date "work_day"
    t.date "substitute_day"
    t.integer "data_type", limit: 1, default: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "pay_day"
    t.integer "period_type", limit: 1
    t.index ["user_id"], name: "index_holiday_works_on_user_id"
  end

  create_table "housing_other_costs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "company_housing_id", null: false
    t.string "name", null: false, comment: "費用名"
    t.integer "amount", null: false, comment: "金額"
    t.integer "cost_type", default: 1, null: false, comment: "費用種別(1:月額, 2:初期)"
    t.integer "tax_type", default: 0, null: false, comment: "税区分(0:非課税, 1:外税, 2:内税)"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["company_housing_id"], name: "index_housing_other_costs_on_company_housing_id"
  end

  create_table "housing_payment_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "housing_payment_id", null: false
    t.integer "item_type", limit: 1, null: false
    t.integer "amount", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["housing_payment_id", "item_type"], name: "index_housing_payment_items_on_housing_payment_id_and_item_type", unique: true
    t.index ["housing_payment_id"], name: "index_housing_payment_items_on_housing_payment_id"
  end

  create_table "housing_payments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_housing_id", null: false
    t.date "payday", null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.string "comment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["company_housing_id", "payday"], name: "index_housing_payments_on_company_housing_id_and_payday", unique: true
    t.index ["company_housing_id"], name: "index_housing_payments_on_company_housing_id"
    t.index ["created_by_id"], name: "index_housing_payments_on_created_by_id"
    t.index ["updated_by_id"], name: "index_housing_payments_on_updated_by_id"
  end

  create_table "instructions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "dated_on"
    t.integer "category", null: false
    t.integer "user_id"
    t.integer "department_id"
    t.integer "asked_user_id"
    t.integer "asked_group_id"
    t.string "description"
    t.integer "status", limit: 1, default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "job_type", limit: 1
    t.integer "requester_id"
    t.integer "reminder_id"
    t.integer "checker_id"
    t.date "completed_on"
    t.string "comment"
    t.string "source"
    t.string "activity"
    t.index ["asked_group_id"], name: "index_instructions_on_asked_group_id"
    t.index ["asked_user_id"], name: "index_instructions_on_asked_user_id"
    t.index ["checker_id"], name: "index_instructions_on_checker_id"
    t.index ["created_by_id"], name: "index_instructions_on_created_by_id"
    t.index ["department_id"], name: "index_instructions_on_department_id"
    t.index ["reminder_id"], name: "index_instructions_on_reminder_id"
    t.index ["requester_id"], name: "index_instructions_on_requester_id"
    t.index ["updated_by_id"], name: "index_instructions_on_updated_by_id"
    t.index ["user_id"], name: "index_instructions_on_user_id"
  end

  create_table "internal_histories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "dated_on", null: false
    t.integer "user_id"
    t.integer "department_id"
    t.integer "item_id", null: false
    t.text "value", size: :medium
    t.integer "status", limit: 1, default: 1, null: false
    t.integer "created_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_internal_histories_on_created_by_id"
    t.index ["department_id"], name: "index_internal_histories_on_department_id"
    t.index ["item_id"], name: "index_internal_histories_on_item_id"
    t.index ["user_id"], name: "index_internal_histories_on_user_id"
  end

  create_table "internal_history_item_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "internal_history_item_id"
    t.integer "group_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id"], name: "index_internal_history_item_groups_on_group_id"
    t.index ["internal_history_item_id"], name: "index_internal_history_item_groups_on_internal_history_item_id"
  end

  create_table "internal_history_item_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "internal_history_item_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["internal_history_item_id"], name: "index_internal_history_item_users_on_internal_history_item_id"
    t.index ["user_id"], name: "index_internal_history_item_users_on_user_id"
  end

  create_table "internal_history_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "key", null: false
    t.string "label", null: false
    t.boolean "enable_user", default: false, null: false
    t.boolean "enable_department", default: false, null: false
    t.text "content", size: :medium, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "sort_order", default: 0, null: false
    t.boolean "read_only", default: false, null: false
    t.boolean "history_only", default: false, null: false
    t.boolean "csv_output", default: false, null: false
    t.integer "disp_type", limit: 1, default: 1, null: false
    t.integer "show_type", default: 0
    t.index ["key"], name: "index_internal_history_items_on_key", unique: true
  end

  create_table "invoice_amounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_business_connection_id", null: false
    t.date "period", null: false
    t.integer "amount"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "expense_file_id"
    t.decimal "tax_rate", precision: 5, scale: 2
    t.boolean "no_invoice_required", default: false
    t.boolean "is_closed", default: false
    t.index ["created_by_id"], name: "index_invoice_amounts_on_created_by_id"
    t.index ["department_business_connection_id", "period", "tax_rate"], name: "index_invoice_amounts_on_dbc_period_tax_rate", unique: true
    t.index ["department_business_connection_id"], name: "index_invoice_amounts_on_department_business_connection_id"
    t.index ["expense_file_id"], name: "index_invoice_amounts_on_expense_file_id"
    t.index ["updated_by_id"], name: "index_invoice_amounts_on_updated_by_id"
  end

  create_table "invoice_details", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "invoice_header_id", null: false
    t.string "item_name", null: false
    t.date "trading_date"
    t.integer "quantity"
    t.string "unit_text"
    t.integer "unit_price"
    t.integer "tax_rate_type", limit: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["invoice_header_id"], name: "index_invoice_details_on_invoice_header_id"
  end

  create_table "invoice_headers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "invoice_number", null: false
    t.string "bill_to", null: false
    t.integer "company_id", null: false
    t.date "billing_date"
    t.date "payment_date"
    t.string "subject"
    t.text "remark"
    t.integer "status", limit: 1, default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "staff_name"
    t.string "staff_address"
    t.string "bank_account"
    t.integer "previous_month_balance"
    t.integer "previous_month_payment"
    t.integer "balance_carried_over"
    t.integer "current_month_amount"
    t.integer "adjust_tax"
    t.index ["company_id"], name: "index_invoice_headers_on_company_id"
    t.index ["created_by_id"], name: "index_invoice_headers_on_created_by_id"
    t.index ["invoice_number"], name: "index_invoice_headers_on_invoice_number", unique: true
    t.index ["updated_by_id"], name: "index_invoice_headers_on_updated_by_id"
  end

  create_table "journal_entry_patterns", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "group_no", null: false
    t.string "name", null: false
    t.integer "row_no", null: false
    t.integer "date_pattern_no", null: false
    t.string "company_code"
    t.string "debit_department_code"
    t.integer "debit_account_code"
    t.integer "debit_account_sub_code"
    t.string "debit_business_connection_code"
    t.string "credit_department_code"
    t.integer "credit_account_code"
    t.integer "credit_account_sub_code"
    t.string "credit_business_connection_code"
    t.boolean "fixed_amount_flag", default: false, null: false
    t.integer "fixed_amount"
    t.boolean "filter_ratio_flag", default: false, null: false
    t.integer "filter_ratio"
    t.boolean "filter_amount_flag", default: false, null: false
    t.integer "filter_amount"
    t.integer "detail_division_no"
    t.boolean "include_tax_flag", default: false, null: false
    t.boolean "tax_calc_flag", default: false, null: false
    t.boolean "accure_flag", default: false, null: false
    t.boolean "delete_flg", default: false, null: false
    t.string "abstract"
    t.integer "debit_tax_class_code", limit: 1
    t.integer "credit_tax_class_code", limit: 1
    t.integer "debit_tax_rate_code", limit: 1
    t.integer "credit_tax_rate_code", limit: 1
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_journal_entry_patterns_on_created_by_id"
    t.index ["updated_by_id"], name: "index_journal_entry_patterns_on_updated_by_id"
  end

  create_table "journal_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "company_code"
    t.string "section"
    t.string "date"
    t.string "debit_bumon"
    t.string "debit_account_code"
    t.string "debit_account_sub_code"
    t.string "debit_business_connection_code"
    t.string "debit_segment1"
    t.string "debit_segment2"
    t.string "debit_division_info1"
    t.string "debit_division_info2"
    t.string "debit_division_info3"
    t.string "debit_division_info4"
    t.string "debit_division_info5"
    t.string "debit_division_info6"
    t.string "debit_division_info7"
    t.string "debit_division_info8"
    t.string "debit_division_info9"
    t.string "debit_division_info10"
    t.string "debit_tax_type"
    t.string "debit_tax_autocalc"
    t.string "debit_amount"
    t.string "credit_bumon"
    t.string "credit_account_code"
    t.string "credit_account_sub_code"
    t.string "credit_business_connection_code"
    t.string "credit_segment1"
    t.string "credit_segment2"
    t.string "credit_division_info1"
    t.string "credit_division_info2"
    t.string "credit_division_info3"
    t.string "credit_division_info4"
    t.string "credit_division_info5"
    t.string "credit_division_info6"
    t.string "credit_division_info7"
    t.string "credit_division_info8"
    t.string "credit_division_info9"
    t.string "credit_division_info10"
    t.string "credit_tax_type"
    t.string "credit_tax_autocalc"
    t.string "credit_amount"
    t.string "remark"
    t.integer "user_id", null: false
    t.string "comment"
    t.date "export_date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_journal_items_on_user_id"
  end

  create_table "kkb_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "code"
    t.integer "parent_id"
    t.integer "kkb_type"
    t.integer "chief_id"
    t.boolean "pass_sekisyo"
    t.boolean "fix_member"
    t.boolean "openness"
    t.string "title"
    t.text "comment", size: :medium
    t.boolean "excepted", default: false
    t.text "menu_remark", size: :medium
    t.text "page_remark", size: :medium
    t.string "color", limit: 7
    t.boolean "important", default: false, null: false
    t.boolean "locked", default: false, null: false
    t.integer "unread_rank", limit: 1
    t.boolean "restrict_pm", default: true, null: false
    t.boolean "enable_new_button", default: true, null: false
    t.index ["code"], name: "index_kkb_categories_on_code", unique: true
    t.index ["user_id"], name: "index_kkb_categories_on_user_id"
  end

  create_table "kkb_category_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_category_id"
    t.integer "group_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.integer "member_type"
    t.index ["group_id"], name: "index_kkb_category_groups_on_group_id"
    t.index ["kkb_category_id"], name: "index_kkb_category_groups_on_kkb_category_id"
  end

  create_table "kkb_category_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_category_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.integer "member_type"
    t.index ["kkb_category_id"], name: "index_kkb_category_users_on_kkb_category_id"
    t.index ["user_id"], name: "index_kkb_category_users_on_user_id"
  end

  create_table "kkb_commenters", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "kkb_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id", "user_id"], name: "index_kkb_commenters_on_kkb_id_and_user_id", unique: true
    t.index ["kkb_id"], name: "index_kkb_commenters_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_commenters_on_user_id"
  end

  create_table "kkb_commuting_exp_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_commuting_exp_id"
    t.date "day"
    t.integer "expense_item_id"
    t.string "purpose"
    t.string "dest_name"
    t.string "start_station"
    t.string "dest_station"
    t.integer "one_or_both_way"
    t.integer "amount"
    t.text "remark", size: :medium
    t.string "remark_bugyo"
    t.integer "department_id"
    t.integer "accounting_item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.float "running_distance"
    t.time "start_time"
    t.time "finish_time"
    t.string "restaurant_name"
    t.string "restaurant_type"
    t.integer "participant_count"
    t.string "participant"
    t.string "approval_number"
    t.string "aim"
    t.integer "haken_shop_id"
    t.integer "day_count"
    t.integer "amount_unit"
    t.boolean "multiple_day"
    t.integer "division_shop_id"
    t.integer "division_project_id"
    t.integer "division_customer_id"
    t.integer "division_evaluated_id"
    t.boolean "editable", default: true, null: false
    t.integer "group_number"
    t.integer "expense_file_id"
    t.string "invoice_number"
    t.index ["accounting_item_id"], name: "index_kkb_commuting_exp_items_on_accounting_item_id"
    t.index ["department_id"], name: "index_kkb_commuting_exp_items_on_department_id"
    t.index ["expense_file_id"], name: "index_kkb_commuting_exp_items_on_expense_file_id"
    t.index ["expense_item_id"], name: "index_kkb_commuting_exp_items_on_expense_item_id"
    t.index ["haken_shop_id"], name: "index_kkb_commuting_exp_items_on_haken_shop_id"
    t.index ["kkb_commuting_exp_id"], name: "index_kkb_commuting_exp_items_on_kkb_commuting_exp_id"
  end

  create_table "kkb_commuting_exps", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "user_id"
    t.date "month"
    t.integer "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "reason", size: :medium
    t.integer "checker_id"
    t.datetime "submitted_at", precision: nil
    t.datetime "fixed_at", precision: nil
    t.integer "data_type", default: 1
    t.integer "haken_checker_id"
    t.date "day"
    t.text "remark", size: :medium
    t.boolean "exist_receipt", default: false, null: false
    t.datetime "first_approved_at", precision: nil
    t.integer "finally_approved_by_id"
    t.datetime "finally_approved_at", precision: nil
    t.integer "first_approved_by_id"
    t.index ["finally_approved_by_id"], name: "index_kkb_commuting_exps_on_finally_approved_by_id"
    t.index ["first_approved_by_id"], name: "index_kkb_commuting_exps_on_first_approved_by_id"
    t.index ["kkb_id"], name: "index_kkb_commuting_exps_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_commuting_exps_on_user_id"
  end

  create_table "kkb_confirms", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "kkb_id"
    t.integer "status"
    t.datetime "time_limit", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "confirmed_at", precision: nil
    t.index ["kkb_id"], name: "index_kkb_confirms_on_kkb_id"
    t.index ["user_id", "kkb_id"], name: "index_kkb_confirms_on_user_id_and_kkb_id"
    t.index ["user_id"], name: "index_kkb_confirms_on_user_id"
  end

  create_table "kkb_custom_configs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "user_id"
    t.integer "kkb_user_category_id"
    t.integer "rank"
    t.integer "color"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["color"], name: "index_kkb_custom_configs_on_color"
    t.index ["kkb_id"], name: "index_kkb_custom_configs_on_kkb_id"
    t.index ["kkb_user_category_id"], name: "index_kkb_custom_configs_on_kkb_user_category_id"
    t.index ["rank"], name: "index_kkb_custom_configs_on_rank"
    t.index ["user_id"], name: "index_kkb_custom_configs_on_user_id"
  end

  create_table "kkb_dests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "kkb_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id"], name: "index_kkb_dests_on_kkb_id"
    t.index ["user_id", "kkb_id"], name: "index_kkb_dests_on_user_id_and_kkb_id"
    t.index ["user_id"], name: "index_kkb_dests_on_user_id"
  end

  create_table "kkb_doc_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.text "remark", size: :medium
    t.integer "parent_id"
    t.integer "user_id"
    t.integer "group_id"
    t.boolean "enable_tool", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "kkb_id"
    t.index ["code"], name: "index_kkb_doc_categories_on_code", unique: true
    t.index ["group_id"], name: "index_kkb_doc_categories_on_group_id"
    t.index ["kkb_id"], name: "index_kkb_doc_categories_on_kkb_id"
    t.index ["parent_id"], name: "index_kkb_doc_categories_on_parent_id"
    t.index ["user_id"], name: "index_kkb_doc_categories_on_user_id"
  end

  create_table "kkb_doc_tags", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "kkb_doc_id"
    t.index ["kkb_doc_id"], name: "index_kkb_doc_tags_on_kkb_doc_id"
  end

  create_table "kkb_docs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "status", limit: 1, default: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "title", null: false
    t.boolean "directory", default: false, null: false
    t.boolean "openness", default: false, null: false
    t.integer "rank", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.string "ancestry"
    t.index ["ancestry"], name: "index_kkb_docs_on_ancestry"
    t.index ["created_by_id"], name: "index_kkb_docs_on_created_by_id"
    t.index ["updated_by_id"], name: "index_kkb_docs_on_updated_by_id"
  end

  create_table "kkb_favorites", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "kkb_id", null: false
    t.integer "user_id", null: false
    t.boolean "selected", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id", "user_id"], name: "index_kkb_favorites_on_kkb_id_and_user_id", unique: true
    t.index ["kkb_id"], name: "index_kkb_favorites_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_favorites_on_user_id"
  end

  create_table "kkb_file_lists", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "user_id"
    t.string "name"
    t.string "comment"
    t.integer "owner_id"
    t.string "file"
    t.string "file_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "status"
    t.string "remark"
    t.string "original_name"
    t.string "date_number"
    t.string "file_name"
    t.boolean "enable_series", default: false
    t.integer "parent_id"
    t.datetime "upload_at", precision: nil
    t.index ["kkb_id"], name: "index_kkb_file_lists_on_kkb_id"
    t.index ["parent_id"], name: "index_kkb_file_lists_on_parent_id"
    t.index ["user_id"], name: "index_kkb_file_lists_on_user_id"
  end

  create_table "kkb_file_project_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.boolean "hidden", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "file"
    t.integer "limit_day_count"
    t.integer "rank"
    t.index ["user_id"], name: "index_kkb_file_project_items_on_user_id"
  end

  create_table "kkb_file_projects", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "user_id"
    t.string "name"
    t.text "comment", size: :medium
    t.string "file"
    t.integer "status", default: 0
    t.boolean "enable_series", default: false
    t.integer "parent_id"
    t.boolean "hidden", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type"
    t.integer "inherited_id"
    t.datetime "upload_at", precision: nil
    t.integer "kkb_file_project_item_id"
    t.date "limit_day"
    t.index ["kkb_file_project_item_id"], name: "index_kkb_file_projects_on_kkb_file_project_item_id"
    t.index ["kkb_id"], name: "index_kkb_file_projects_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_file_projects_on_user_id"
  end

  create_table "kkb_fixed_processes", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "data_type"
    t.date "target_date"
    t.date "payday"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["data_type", "target_date"], name: "index_kkb_fixed_processes_on_data_type_and_target_date", unique: true
    t.index ["user_id"], name: "index_kkb_fixed_processes_on_user_id"
  end

  create_table "kkb_follow_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "kkb_id", null: false
    t.integer "user_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id", "user_id"], name: "index_kkb_follow_comments_on_kkb_id_and_user_id"
    t.index ["kkb_id"], name: "index_kkb_follow_comments_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_follow_comments_on_user_id"
  end

  create_table "kkb_follows", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id", "user_id"], name: "index_kkb_follows_on_kkb_id_and_user_id", unique: true
    t.index ["kkb_id"], name: "index_kkb_follows_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_follows_on_user_id"
  end

  create_table "kkb_generators", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.boolean "append_date", default: false, null: false
    t.boolean "hidden", default: false, null: false
    t.boolean "pass_sekisyo", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "enable_sun", default: true, null: false
    t.boolean "enable_mon", default: true, null: false
    t.boolean "enable_tue", default: true, null: false
    t.boolean "enable_wed", default: true, null: false
    t.boolean "enable_thu", default: true, null: false
    t.boolean "enable_fri", default: true, null: false
    t.boolean "enable_sat", default: true, null: false
    t.boolean "enable_hol", default: true, null: false
    t.boolean "enable_w1", default: true, null: false
    t.boolean "enable_w2", default: true, null: false
    t.boolean "enable_w3", default: true, null: false
    t.boolean "enable_w4", default: true, null: false
    t.boolean "enable_w5", default: true, null: false
    t.boolean "duplicate", default: false, null: false
    t.date "dated_on"
    t.index ["kkb_id"], name: "index_kkb_generators_on_kkb_id"
  end

  create_table "kkb_generic_form_contents", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "user_id"
    t.integer "kkb_generic_form_id"
    t.integer "destination_id"
    t.integer "status"
    t.text "content", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_generic_form_id"], name: "index_kkb_generic_form_contents_on_kkb_generic_form_id"
    t.index ["kkb_id"], name: "index_kkb_generic_form_contents_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_generic_form_contents_on_user_id"
  end

  create_table "kkb_generic_forms", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code"
    t.text "content", size: :medium
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_kkb_generic_forms_on_user_id"
  end

  create_table "kkb_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "group_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "member_type"
    t.index ["group_id"], name: "index_kkb_groups_on_group_id"
    t.index ["kkb_id"], name: "index_kkb_groups_on_kkb_id"
  end

  create_table "kkb_links", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "kkb_id"
    t.integer "related_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id"], name: "index_kkb_links_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_links_on_user_id"
  end

  create_table "kkb_members", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "member_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "kkb_id"
    t.index ["kkb_id"], name: "index_kkb_members_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_members_on_user_id"
  end

  create_table "kkb_memos", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "user_id"
    t.text "remark", size: :medium
    t.integer "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id"], name: "index_kkb_memos_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_memos_on_user_id"
  end

  create_table "kkb_messages", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "destination_id"
    t.integer "status"
    t.integer "sekisyo_id"
    t.text "content", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "source_id"
    t.string "file_name"
    t.string "file_type"
    t.integer "kkb_id"
    t.string "file"
    t.string "code"
    t.integer "dest_group_id"
    t.integer "src_group_id"
    t.index ["code"], name: "index_kkb_messages_on_code", unique: true
    t.index ["dest_group_id"], name: "fk_rails_479978ea99"
    t.index ["kkb_id"], name: "index_kkb_messages_on_kkb_id"
    t.index ["src_group_id"], name: "index_kkb_messages_on_src_group_id"
    t.index ["user_id"], name: "index_kkb_messages_on_user_id"
  end

  create_table "kkb_misc_exp_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_misc_exp_id"
    t.integer "item_number"
    t.integer "amount"
    t.integer "amount_user"
    t.string "approval_number"
    t.text "remark", size: :medium
    t.text "remark_user", size: :medium
    t.integer "accounting_item_id"
    t.integer "department_id"
    t.integer "business_connection_id"
    t.integer "division_shop_id"
    t.integer "division_project_id"
    t.integer "division_customer_id"
    t.integer "division_evaluated_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "business_connection_code"
    t.string "remark_bugyo"
    t.index ["accounting_item_id"], name: "index_kkb_misc_exp_items_on_accounting_item_id"
    t.index ["business_connection_id"], name: "index_kkb_misc_exp_items_on_business_connection_id"
    t.index ["department_id"], name: "index_kkb_misc_exp_items_on_department_id"
    t.index ["kkb_misc_exp_id"], name: "index_kkb_misc_exp_items_on_kkb_misc_exp_id"
  end

  create_table "kkb_misc_exps", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "user_id"
    t.date "day"
    t.integer "page_number"
    t.integer "amount"
    t.string "approval_number"
    t.string "file"
    t.integer "status"
    t.integer "expense_item_id"
    t.integer "department_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hmb_check", default: false
    t.boolean "accounting_check", default: false
    t.string "file1"
    t.string "file2"
    t.string "file3"
    t.string "file4"
    t.string "file5"
    t.string "doc_file"
    t.string "customer_info"
    t.string "place_info"
    t.datetime "fixed_at", precision: nil
    t.text "dismiss_reason", size: :medium
    t.integer "concerned_customer_id"
    t.integer "concerned_shop_id"
    t.integer "hmb_checker_id"
    t.integer "accounting_checker_id"
    t.boolean "submitted_once", default: false
    t.index ["concerned_customer_id"], name: "index_kkb_misc_exps_on_concerned_customer_id"
    t.index ["concerned_shop_id"], name: "index_kkb_misc_exps_on_concerned_shop_id"
    t.index ["department_id"], name: "index_kkb_misc_exps_on_department_id"
    t.index ["expense_item_id"], name: "index_kkb_misc_exps_on_expense_item_id"
    t.index ["kkb_id"], name: "index_kkb_misc_exps_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_misc_exps_on_user_id"
  end

  create_table "kkb_nonshift_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type"
    t.integer "job_type", limit: 1
    t.integer "employment", limit: 1
    t.integer "limit_year"
    t.index ["code"], name: "index_kkb_nonshift_categories_on_code", unique: true
    t.index ["user_id"], name: "index_kkb_nonshift_categories_on_user_id"
  end

  create_table "kkb_nonshift_checks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "kkb_nonshift_category_id"
    t.date "day"
    t.boolean "checked"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_nonshift_category_id"], name: "index_kkb_nonshift_checks_on_kkb_nonshift_category_id"
    t.index ["user_id"], name: "index_kkb_nonshift_checks_on_user_id"
  end

  create_table "kkb_nonshift_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_nonshift_work_id"
    t.integer "kkb_nonshift_category_id"
    t.integer "user_id"
    t.date "day"
    t.string "comment"
    t.boolean "countable_roster", default: true, null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_nonshift_category_id"], name: "index_kkb_nonshift_users_on_kkb_nonshift_category_id"
    t.index ["kkb_nonshift_work_id"], name: "index_kkb_nonshift_users_on_kkb_nonshift_work_id"
    t.index ["user_id"], name: "index_kkb_nonshift_users_on_user_id"
  end

  create_table "kkb_nonshift_works", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.integer "status"
    t.text "remark", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "kkb_nonshift_category_id"
    t.time "start_time"
    t.time "finish_time"
    t.boolean "countable_roster", default: true, null: false
    t.index ["kkb_nonshift_category_id"], name: "index_kkb_nonshift_works_on_kkb_nonshift_category_id"
    t.index ["user_id"], name: "index_kkb_nonshift_works_on_user_id"
  end

  create_table "kkb_optional_functions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_category_id"
    t.boolean "enabled"
    t.integer "function_code"
    t.string "option"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_category_id"], name: "index_kkb_optional_functions_on_kkb_category_id"
  end

  create_table "kkb_parametrics", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.string "code", limit: 16
    t.string "sub_code", limit: 16
    t.text "value", size: :medium
    t.index ["kkb_id"], name: "index_kkb_parametrics_on_kkb_id"
  end

  create_table "kkb_related_haken_shops", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "haken_shop_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["haken_shop_id"], name: "index_kkb_related_haken_shops_on_haken_shop_id"
    t.index ["kkb_id"], name: "index_kkb_related_haken_shops_on_kkb_id"
  end

  create_table "kkb_routine_dates", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_routine_id"
    t.integer "user_id"
    t.integer "month"
    t.integer "day"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_routine_id"], name: "index_kkb_routine_dates_on_kkb_routine_id"
    t.index ["user_id"], name: "index_kkb_routine_dates_on_user_id"
  end

  create_table "kkb_routine_kkbs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_routine_id"
    t.integer "kkb_id"
    t.date "day"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id"], name: "index_kkb_routine_kkbs_on_kkb_id"
    t.index ["kkb_routine_id"], name: "index_kkb_routine_kkbs_on_kkb_routine_id"
  end

  create_table "kkb_routine_wdays", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_routine_id"
    t.integer "user_id"
    t.integer "number"
    t.boolean "sun"
    t.boolean "mon"
    t.boolean "tue"
    t.boolean "wed"
    t.boolean "thu"
    t.boolean "fri"
    t.boolean "sat"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_routine_id"], name: "index_kkb_routine_wdays_on_kkb_routine_id"
    t.index ["user_id"], name: "index_kkb_routine_wdays_on_user_id"
  end

  create_table "kkb_routine_weeks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_routine_id"
    t.integer "user_id"
    t.integer "wday"
    t.boolean "w1"
    t.boolean "w2"
    t.boolean "w3"
    t.boolean "w4"
    t.boolean "w5"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_routine_id"], name: "index_kkb_routine_weeks_on_kkb_routine_id"
    t.index ["user_id"], name: "index_kkb_routine_weeks_on_user_id"
  end

  create_table "kkb_routines", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "kkb_category_id"
    t.text "comment", size: :medium
    t.boolean "multiple_kkb"
    t.integer "kkb_stage_id"
    t.integer "kkb_id"
    t.integer "schedule_id"
    t.date "start_date"
    t.date "finish_date"
    t.index ["kkb_category_id"], name: "index_kkb_routines_on_kkb_category_id"
    t.index ["kkb_id"], name: "index_kkb_routines_on_kkb_id"
    t.index ["kkb_stage_id"], name: "index_kkb_routines_on_kkb_stage_id"
    t.index ["schedule_id"], name: "index_kkb_routines_on_schedule_id"
    t.index ["user_id"], name: "index_kkb_routines_on_user_id"
  end

  create_table "kkb_sekisyo_checks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "resource_type"
    t.integer "resource_id"
    t.integer "user_id"
    t.integer "kkb_id"
    t.integer "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id"], name: "index_kkb_sekisyo_checks_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_sekisyo_checks_on_user_id"
  end

  create_table "kkb_stages", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "rank"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_kkb_stages_on_code", unique: true
    t.index ["user_id"], name: "index_kkb_stages_on_user_id"
  end

  create_table "kkb_time_limits", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "old_time_limit", precision: nil
    t.datetime "new_time_limit", precision: nil
    t.string "reason"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "kkb_id"
    t.index ["kkb_id"], name: "index_kkb_time_limits_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_time_limits_on_user_id"
  end

  create_table "kkb_urls", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "kkb_id"
    t.text "url", size: :long
    t.integer "url_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "title"
    t.text "comment", size: :long
    t.index ["kkb_id"], name: "index_kkb_urls_on_kkb_id"
    t.index ["user_id"], name: "index_kkb_urls_on_user_id"
  end

  create_table "kkb_user_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "code"
    t.index ["user_id"], name: "index_kkb_user_categories_on_user_id"
  end

  create_table "kkb_work_rules", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kkb_id", null: false
    t.integer "company_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["company_id"], name: "index_kkb_work_rules_on_company_id"
    t.index ["kkb_id"], name: "index_kkb_work_rules_on_kkb_id"
  end

  create_table "kkbs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_type"
    t.string "title"
    t.integer "user_id"
    t.integer "status"
    t.boolean "openness", default: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "comment", size: :long
    t.integer "sekisyo_id"
    t.boolean "anonymous"
    t.datetime "time_limit", precision: nil
    t.datetime "start_time", precision: nil
    t.string "user_name"
    t.integer "kkb_category_id"
    t.integer "owner_id"
    t.integer "kkb_stage_id"
    t.boolean "restrict_pm"
    t.boolean "excepted", default: false
    t.datetime "fixed_at", precision: nil
    t.date "day"
    t.string "ext_info"
    t.boolean "pass_sekisyo_message", default: false, null: false
    t.integer "section", limit: 1, default: 0, null: false
    t.boolean "disable_print", default: false, null: false
    t.integer "group_id"
    t.boolean "member_only", default: false, null: false
    t.integer "department_id"
    t.index ["group_id"], name: "index_kkbs_on_group_id"
    t.index ["kkb_category_id"], name: "index_kkbs_on_kkb_category_id"
    t.index ["kkb_stage_id"], name: "index_kkbs_on_kkb_stage_id"
    t.index ["updated_at"], name: "index_kkbs_on_updated_at"
    t.index ["user_id"], name: "index_kkbs_on_user_id"
  end

  create_table "labor_cost_payments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "data_type", limit: 1, null: false
    t.date "pay_on", null: false
    t.integer "amount", default: 0, null: false
    t.string "destination_name"
    t.integer "user_id"
    t.string "comment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_labor_cost_payments_on_created_by_id"
    t.index ["updated_by_id"], name: "index_labor_cost_payments_on_updated_by_id"
    t.index ["user_id"], name: "index_labor_cost_payments_on_user_id"
  end

  create_table "legal_holiday_counts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "employment", null: false
    t.date "day", null: false
    t.integer "count", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["employment", "day"], name: "index_legal_holiday_counts_on_employment_and_day", unique: true
  end

  create_table "ma_document_types", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "category", limit: 1
    t.integer "item_number", limit: 1
    t.integer "sub_number", limit: 1
    t.string "description"
    t.boolean "each_store", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_ma_document_types_on_created_by_id"
    t.index ["updated_by_id"], name: "index_ma_document_types_on_updated_by_id"
  end

  create_table "ma_header_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "ma_header_id", null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.string "comment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "dated_on"
    t.time "start_time"
    t.integer "user_id"
    t.date "opening_date"
    t.bigint "file_id"
    t.integer "company_id"
    t.index ["company_id"], name: "index_ma_header_comments_on_company_id"
    t.index ["created_by_id"], name: "index_ma_header_comments_on_created_by_id"
    t.index ["ma_header_id"], name: "index_ma_header_comments_on_ma_header_id"
    t.index ["updated_by_id"], name: "index_ma_header_comments_on_updated_by_id"
    t.index ["user_id"], name: "index_ma_header_comments_on_user_id"
  end

  create_table "ma_headers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "serial_number", null: false
    t.string "project_name"
    t.date "applied_on"
    t.string "source"
    t.integer "shop_scheme", limit: 1
    t.integer "debt"
    t.integer "asking_price"
    t.integer "commission"
    t.date "responded_on"
    t.text "comment", size: :medium
    t.integer "status", limit: 1
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "source_type", limit: 1
    t.text "result_comment", size: :medium
    t.integer "kkb_id"
    t.integer "company_section", limit: 1
    t.integer "sort_order", default: 1, null: false
    t.boolean "competitors_exist", default: false, null: false
    t.string "competitors_info"
    t.string "seller_company_name"
    t.string "seller_address"
    t.string "seller_representative"
    t.integer "seller_job_type", limit: 1
    t.string "seller_age"
    t.string "seller_after_transfer"
    t.string "seller_stockholders"
    t.string "seller_reason"
    t.integer "kkb_fixed_id"
    t.integer "member_type", limit: 1
    t.date "ma_close_on"
    t.string "company_name"
    t.string "representative_name"
    t.string "establisher_name"
    t.string "chief_name"
    t.string "shift_plan"
    t.string "receipt_computer"
    t.text "other_ma_comment", size: :medium
    t.string "acquirer_company_name"
    t.integer "kkb_progress_id"
    t.string "company_address"
    t.integer "business_type", limit: 1, default: 1, null: false
    t.boolean "attack_list", default: false, null: false
    t.string "closing_period"
    t.integer "investment_value"
    t.string "payback_period_long"
    t.string "payback_period_short"
    t.text "strategy_comment"
    t.integer "finance_value"
    t.text "progress_url"
    t.string "management_number"
    t.text "financial_condition"
    t.text "document_url"
    t.text "department_progress_url"
    t.index ["created_by_id"], name: "index_ma_headers_on_created_by_id"
    t.index ["kkb_fixed_id"], name: "index_ma_headers_on_kkb_fixed_id"
    t.index ["kkb_id"], name: "index_ma_headers_on_kkb_id"
    t.index ["kkb_progress_id"], name: "index_ma_headers_on_kkb_progress_id"
    t.index ["serial_number"], name: "index_ma_headers_on_serial_number", unique: true
    t.index ["updated_by_id"], name: "index_ma_headers_on_updated_by_id"
  end

  create_table "ma_meeting_members", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "ma_header_comment_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ma_header_comment_id", "user_id"], name: "ma_meeting_members_index", unique: true
    t.index ["ma_header_comment_id"], name: "index_ma_meeting_members_on_ma_header_comment_id"
    t.index ["user_id"], name: "index_ma_meeting_members_on_user_id"
  end

  create_table "ma_progress_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "ma_header_id", null: false
    t.integer "category", limit: 1, null: false
    t.integer "item_number", limit: 1, null: false
    t.string "item_name"
    t.string "description"
    t.date "scheduled_on"
    t.date "completed_on"
    t.string "comment"
    t.integer "user_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_ma_progress_values_on_created_by_id"
    t.index ["ma_header_id", "category", "item_number"], name: "ma_progress_values_index", unique: true
    t.index ["ma_header_id"], name: "index_ma_progress_values_on_ma_header_id"
    t.index ["updated_by_id"], name: "index_ma_progress_values_on_updated_by_id"
    t.index ["user_id"], name: "index_ma_progress_values_on_user_id"
  end

  create_table "ma_project_documents", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "ma_project_id", null: false
    t.integer "ma_document_type_id", null: false
    t.integer "ma_store_id"
    t.boolean "unnecessary", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_ma_project_documents_on_created_by_id"
    t.index ["ma_document_type_id"], name: "index_ma_project_documents_on_ma_document_type_id"
    t.index ["ma_project_id"], name: "index_ma_project_documents_on_ma_project_id"
    t.index ["ma_store_id"], name: "index_ma_project_documents_on_ma_store_id"
    t.index ["updated_by_id"], name: "index_ma_project_documents_on_updated_by_id"
  end

  create_table "ma_projects", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "project_name"
    t.integer "status", limit: 1, default: 1
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "place_name"
    t.integer "shop_scheme", limit: 1
    t.integer "company_section", limit: 1
    t.integer "ma_header_id"
    t.integer "prefecture", null: false
    t.string "municipality", null: false
    t.integer "shop_count"
    t.index ["created_by_id"], name: "index_ma_projects_on_created_by_id"
    t.index ["ma_header_id"], name: "index_ma_projects_on_ma_header_id"
    t.index ["updated_by_id"], name: "index_ma_projects_on_updated_by_id"
  end

  create_table "ma_shared_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "category", limit: 1, null: false
    t.integer "item_number", limit: 1, null: false
    t.string "description"
    t.integer "type_1", limit: 1
    t.integer "type_2", limit: 1
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["category", "item_number"], name: "ma_shared_types_index"
    t.index ["created_by_id"], name: "index_ma_shared_items_on_created_by_id"
    t.index ["updated_by_id"], name: "index_ma_shared_items_on_updated_by_id"
  end

  create_table "ma_shared_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "ma_header_id", null: false
    t.integer "item_id", null: false
    t.string "value_1"
    t.string "value_2"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_ma_shared_values_on_created_by_id"
    t.index ["item_id"], name: "index_ma_shared_values_on_item_id"
    t.index ["ma_header_id", "item_id"], name: "ma_shared_values_index", unique: true
    t.index ["ma_header_id"], name: "index_ma_shared_values_on_ma_header_id"
    t.index ["updated_by_id"], name: "index_ma_shared_values_on_updated_by_id"
  end

  create_table "ma_store_work_hours", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "ma_store_id", null: false
    t.integer "wday", limit: 1, null: false
    t.integer "schedule_type", limit: 1
    t.time "start_at"
    t.time "end_at"
    t.integer "rest_time"
    t.integer "interval_type", limit: 1, default: 1, null: false
    t.boolean "w1", default: false, null: false
    t.boolean "w2", default: false, null: false
    t.boolean "w3", default: false, null: false
    t.boolean "w4", default: false, null: false
    t.boolean "w5", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_ma_store_work_hours_on_created_by_id"
    t.index ["ma_store_id", "wday"], name: "ma_store_work_hours_index", unique: true
    t.index ["ma_store_id"], name: "index_ma_store_work_hours_on_ma_store_id"
    t.index ["updated_by_id"], name: "index_ma_store_work_hours_on_updated_by_id"
  end

  create_table "ma_stores", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "ma_project_id", null: false
    t.string "store_name", null: false
    t.integer "department_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "clinic_name"
    t.string "doctor_age"
    t.integer "clinical_dept_1", limit: 1
    t.integer "clinical_dept_2", limit: 1
    t.integer "ratio_1", limit: 1
    t.integer "ratio_2", limit: 1
    t.integer "prescription_count"
    t.integer "sales"
    t.integer "medicine_cost"
    t.integer "technical_fee"
    t.integer "rents"
    t.integer "parent_id"
    t.integer "status", limit: 1
    t.float "technical_fee_rate"
    t.integer "dispensing_sales"
    t.integer "home_care_personal"
    t.integer "home_care_facility"
    t.float "pharmacist_count"
    t.float "office_worker_count"
    t.string "store_code"
    t.string "internal_name"
    t.string "post_code"
    t.integer "prefecture", limit: 1
    t.string "municipality"
    t.string "house_number"
    t.string "building_name"
    t.string "tel"
    t.string "fax"
    t.string "bureau_accept_status"
    t.text "comment", size: :medium
    t.integer "pharmacist_plan"
    t.integer "office_worker_plan"
    t.string "internal_kana"
    t.string "company_name"
    t.index ["created_by_id"], name: "index_ma_stores_on_created_by_id"
    t.index ["department_id"], name: "index_ma_stores_on_department_id"
    t.index ["ma_project_id"], name: "index_ma_stores_on_ma_project_id"
    t.index ["parent_id"], name: "index_ma_stores_on_parent_id"
    t.index ["updated_by_id"], name: "index_ma_stores_on_updated_by_id"
  end

  create_table "mail_queues", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.string "send_to", null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.integer "mail_type", limit: 1, null: false
    t.integer "created_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_mail_queues_on_created_by_id"
  end

  create_table "manager_days", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "item_number", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "user_id", null: false
    t.date "day", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_manager_days_on_created_by_id"
    t.index ["updated_by_id"], name: "index_manager_days_on_updated_by_id"
    t.index ["user_id"], name: "index_manager_days_on_user_id"
  end

  create_table "map_locations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "kana"
    t.string "address"
    t.string "latitude"
    t.string "longitude"
    t.string "prefecture_code"
    t.string "prefecture_name"
    t.integer "server_type", limit: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "railway_name"
    t.index ["code"], name: "index_map_locations_on_code", unique: true
  end

  create_table "medicine_exchange_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "medicine_exchange_id", null: false
    t.integer "department_id", null: false
    t.text "content"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id"], name: "index_medicine_exchange_comments_on_department_id"
    t.index ["medicine_exchange_id"], name: "index_medicine_exchange_comments_on_medicine_exchange_id"
  end

  create_table "medicine_exchanges", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "data_type", limit: 1, default: 0, null: false
    t.text "content"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id"], name: "index_medicine_exchanges_on_department_id"
  end

  create_table "member_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "resource_type", null: false
    t.integer "resource_id", null: false
    t.integer "group_id", null: false
    t.integer "member_type", limit: 2, default: 0
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id"], name: "index_member_groups_on_group_id"
    t.index ["resource_type", "resource_id"], name: "index_member_groups_on_resource_type_and_resource_id"
  end

  create_table "member_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "resource_type"
    t.integer "resource_id"
    t.integer "user_id"
    t.integer "member_type", default: 0
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["resource_type", "resource_id"], name: "index_member_users_on_resource_type_and_resource_id"
    t.index ["user_id"], name: "index_member_users_on_user_id"
  end

  create_table "modify_departments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.date "day"
    t.integer "key", limit: 1, default: 1, null: false
    t.string "value"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_modify_departments_on_created_by_id"
    t.index ["department_id", "day", "key"], name: "index_modify_departments", unique: true
    t.index ["department_id"], name: "index_modify_departments_on_department_id"
    t.index ["updated_by_id"], name: "index_modify_departments_on_updated_by_id"
  end

  create_table "modify_exchange_settings", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.date "applied_on", null: false
    t.integer "key", limit: 1, null: false
    t.string "value"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_modify_exchange_settings_on_created_by_id"
    t.index ["department_id", "applied_on", "key"], name: "modify_exchange_settings_index", unique: true
    t.index ["department_id"], name: "index_modify_exchange_settings_on_department_id"
    t.index ["updated_by_id"], name: "index_modify_exchange_settings_on_updated_by_id"
  end

  create_table "modify_time_cards", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "time_record_id", null: false
    t.integer "department_id", null: false
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil, null: false
    t.datetime "rest_start_time", precision: nil
    t.datetime "rest_end_time", precision: nil
    t.integer "confirmed_by_id"
    t.datetime "confirmed_at", precision: nil
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "time_card_id"
    t.string "comment"
    t.index ["confirmed_by_id"], name: "index_modify_time_cards_on_confirmed_by_id"
    t.index ["department_id"], name: "index_modify_time_cards_on_department_id"
    t.index ["time_card_id"], name: "index_modify_time_cards_on_time_card_id"
    t.index ["time_record_id"], name: "index_modify_time_cards_on_time_record_id"
  end

  create_table "modify_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.integer "key", limit: 1, default: 1, null: false
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "old_value"
    t.integer "edit_user_id"
    t.index ["edit_user_id"], name: "index_modify_users_on_edit_user_id"
    t.index ["user_id", "day", "key"], name: "index_modify_users_on_user_id_and_day_and_key"
    t.index ["user_id"], name: "index_modify_users_on_user_id"
  end

  create_table "municipalities", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", null: false
    t.integer "prefecture", limit: 1, null: false
    t.string "name", null: false
    t.string "kana", null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "national_holidays", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "nearby_clinic_departments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "nearby_clinic_id", null: false
    t.integer "clinical_department_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["clinical_department_id"], name: "index_nearby_clinic_departments_on_clinical_department_id"
    t.index ["nearby_clinic_id", "clinical_department_id"], name: "nearby_clinic_department_index", unique: true
    t.index ["nearby_clinic_id"], name: "index_nearby_clinic_departments_on_nearby_clinic_id"
  end

  create_table "nearby_clinic_stations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "nearby_clinic_id", null: false
    t.integer "location_station_id"
    t.integer "on_foot_minutes"
    t.integer "by_bus_minutes"
    t.integer "by_car_minutes"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["location_station_id"], name: "index_nearby_clinic_stations_on_location_station_id"
    t.index ["nearby_clinic_id"], name: "index_nearby_clinic_stations_on_nearby_clinic_id"
  end

  create_table "nearby_clinics", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.string "name", null: false
    t.string "post_code"
    t.string "address"
    t.string "successor"
    t.integer "contact_id"
    t.integer "disaster_id"
    t.text "details", size: :medium
    t.text "special_notes", size: :medium
    t.text "secret_info", size: :medium
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "clinical_subjects"
    t.boolean "prescription_received", default: false, null: false
    t.integer "map_location_id"
    t.text "nearby_departments"
    t.index ["contact_id"], name: "index_nearby_clinics_on_contact_id"
    t.index ["created_by_id"], name: "index_nearby_clinics_on_created_by_id"
    t.index ["department_id"], name: "index_nearby_clinics_on_department_id"
    t.index ["disaster_id"], name: "index_nearby_clinics_on_disaster_id"
    t.index ["map_location_id"], name: "index_nearby_clinics_on_map_location_id"
    t.index ["updated_by_id"], name: "index_nearby_clinics_on_updated_by_id"
  end

  create_table "nearby_distances", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "map_location_id", null: false
    t.float "distance", default: 0.0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id", "map_location_id"], name: "index_nearby_distances_on_department_id_and_map_location_id", unique: true
    t.index ["department_id"], name: "index_nearby_distances_on_department_id"
    t.index ["map_location_id"], name: "index_nearby_distances_on_map_location_id"
  end

  create_table "nearby_home_care_stations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "nearby_home_care_id", null: false
    t.integer "location_station_id"
    t.integer "on_foot_minutes"
    t.integer "by_bus_minutes"
    t.integer "by_car_minutes"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["location_station_id"], name: "index_nearby_home_care_stations_on_location_station_id"
    t.index ["nearby_home_care_id"], name: "index_nearby_home_care_stations_on_nearby_home_care_id"
  end

  create_table "nearby_home_cares", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.string "name", null: false
    t.string "post_code"
    t.string "address"
    t.integer "patient_count"
    t.text "comment"
    t.integer "map_location_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "nearby_departments"
    t.integer "prescription_status", limit: 1, default: 0, null: false
    t.index ["created_by_id"], name: "index_nearby_home_cares_on_created_by_id"
    t.index ["department_id"], name: "index_nearby_home_cares_on_department_id"
    t.index ["map_location_id"], name: "index_nearby_home_cares_on_map_location_id"
    t.index ["updated_by_id"], name: "index_nearby_home_cares_on_updated_by_id"
  end

  create_table "nearby_key_figures", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "nearby_clinic_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.string "name", null: false
    t.string "kana"
    t.string "age"
    t.text "relationship", size: :medium
    t.text "special_notes", size: :medium
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_nearby_key_figures_on_created_by_id"
    t.index ["nearby_clinic_id"], name: "index_nearby_key_figures_on_nearby_clinic_id"
    t.index ["updated_by_id"], name: "index_nearby_key_figures_on_updated_by_id"
  end

  create_table "nkk_days", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "wday", limit: 1
    t.index ["user_id", "day"], name: "index_nkk_days_on_user_id_and_day", unique: true
    t.index ["user_id"], name: "index_nkk_days_on_user_id"
  end

  create_table "notifications", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "author_id"
    t.date "day"
    t.string "remark"
    t.integer "status", limit: 1, default: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type", limit: 1, default: 1, null: false
    t.index ["author_id"], name: "index_notifications_on_author_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "numbers_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id"
    t.date "day"
    t.integer "edit_user_id"
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "period_type", limit: 1, default: 1, null: false
    t.index ["department_id", "period_type", "day"], name: "idx_dep_type_day", unique: true
    t.index ["department_id"], name: "index_numbers_comments_on_department_id"
    t.index ["edit_user_id"], name: "fk_rails_ee35153bb0"
  end

  create_table "off_hours_reports", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.date "reported_on"
    t.datetime "occurred_at", precision: nil
    t.datetime "ended_at", precision: nil
    t.string "patient_name"
    t.string "contact_name"
    t.date "patient_birthday"
    t.string "contact_tel"
    t.text "inquiry", size: :medium
    t.text "response", size: :medium
    t.text "takeover", size: :medium
    t.integer "status", limit: 1, default: 1, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "kkb_id"
    t.integer "patient_age", limit: 1
    t.boolean "completed", default: true, null: false
    t.index ["created_by_id"], name: "index_off_hours_reports_on_created_by_id"
    t.index ["department_id"], name: "index_off_hours_reports_on_department_id"
    t.index ["kkb_id"], name: "index_off_hours_reports_on_kkb_id"
    t.index ["updated_by_id"], name: "index_off_hours_reports_on_updated_by_id"
    t.index ["user_id"], name: "index_off_hours_reports_on_user_id"
  end

  create_table "op_calendar_dest_designs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_operation_id", null: false
    t.integer "calendar_dest_design_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.index ["calendar_dest_design_id"], name: "index_op_calendar_dest_designs_on_calendar_dest_design_id"
    t.index ["shift_operation_id"], name: "index_op_calendar_dest_designs_on_shift_operation_id"
  end

  create_table "op_calendar_dests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_operation_id", null: false
    t.integer "calendar_dest_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.index ["calendar_dest_id"], name: "index_op_calendar_dests_on_calendar_dest_id"
    t.index ["shift_operation_id"], name: "index_op_calendar_dests_on_shift_operation_id"
  end

  create_table "op_shift_dest_designs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_operation_id", null: false
    t.integer "shift_dest_design_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.index ["shift_dest_design_id"], name: "index_op_shift_dest_designs_on_shift_dest_design_id"
    t.index ["shift_operation_id"], name: "index_op_shift_dest_designs_on_shift_operation_id"
  end

  create_table "op_shift_dests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_operation_id", null: false
    t.integer "shift_dest_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.index ["shift_dest_id"], name: "index_op_shift_dests_on_shift_dest_id"
    t.index ["shift_operation_id"], name: "index_op_shift_dests_on_shift_operation_id"
  end

  create_table "op_shift_user_designs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_operation_id", null: false
    t.integer "shift_user_design_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.index ["shift_operation_id"], name: "index_op_shift_user_designs_on_shift_operation_id"
    t.index ["shift_user_design_id"], name: "index_op_shift_user_designs_on_shift_user_design_id"
  end

  create_table "op_shift_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_operation_id", null: false
    t.integer "shift_user_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.index ["shift_operation_id"], name: "index_op_shift_users_on_shift_operation_id"
    t.index ["shift_user_id"], name: "index_op_shift_users_on_shift_user_id"
  end

  create_table "organization_knowhows", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "organization_unit_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["organization_unit_id"], name: "fk_rails_0b77d9ddc8"
  end

  create_table "organization_unit_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "organization_unit_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "position"
    t.integer "position_id"
    t.index ["organization_unit_id", "user_id"], name: "organization_unit_users_index", unique: true
    t.index ["organization_unit_id"], name: "index_organization_unit_users_on_organization_unit_id"
    t.index ["user_id"], name: "index_organization_unit_users_on_user_id"
  end

  create_table "organization_units", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "parent_id"
    t.integer "manager_id"
    t.integer "row_number", limit: 1
    t.integer "col_number", limit: 1
    t.boolean "has_folder", default: true, null: false
    t.integer "sort_order", default: 0, null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "description"
    t.date "start_on"
    t.date "end_on"
    t.string "symbol"
    t.integer "task_count", default: 0
    t.string "folder_url"
    t.integer "user_segment_id"
    t.boolean "displayable", default: false, null: false
    t.index ["code"], name: "index_organization_units_on_code", unique: true
    t.index ["manager_id"], name: "index_organization_units_on_manager_id"
    t.index ["parent_id"], name: "index_organization_units_on_parent_id"
    t.index ["user_segment_id"], name: "index_organization_units_on_user_segment_id"
  end

  create_table "over_time_apps", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "confirmed_by_id"
    t.integer "department_id"
    t.date "day", null: false
    t.datetime "end_time", precision: nil, null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.string "reason"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["confirmed_by_id"], name: "index_over_time_apps_on_confirmed_by_id"
    t.index ["day", "user_id"], name: "index_over_time_apps_on_day_and_user_id", unique: true
    t.index ["department_id"], name: "index_over_time_apps_on_department_id"
    t.index ["user_id"], name: "index_over_time_apps_on_user_id"
  end

  create_table "paid_holiday_counts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "year", null: false
    t.float "carry_over", default: 0.0, null: false
    t.float "count", default: 0.0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "created_by_id"
    t.index ["created_by_id"], name: "index_paid_holiday_counts_on_created_by_id"
    t.index ["user_id", "year"], name: "index_paid_holiday_counts_on_user_id_and_year", unique: true
    t.index ["user_id"], name: "index_paid_holiday_counts_on_user_id"
  end

  create_table "pattern_masters", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "pattern_group_code", limit: 20, null: false
    t.string "pattern_group_name", limit: 100, null: false
    t.text "description"
    t.boolean "active_flg", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["active_flg", "pattern_group_code"], name: "index_pattern_masters_on_active_flg_and_pattern_group_code"
    t.index ["active_flg"], name: "index_pattern_masters_on_active_flg"
    t.index ["pattern_group_code"], name: "index_pattern_masters_on_pattern_group_code", unique: true
  end

  create_table "payment_destinations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.integer "payment_type", limit: 1, null: false
    t.string "bank_code"
    t.string "bank_name"
    t.string "branch_code"
    t.string "branch_name"
    t.string "account_number"
    t.string "account_name"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "deposit_type", limit: 1
    t.string "bank_kana"
    t.string "branch_kana"
    t.string "account_kana"
    t.index ["created_by_id"], name: "index_payment_destinations_on_created_by_id"
    t.index ["updated_by_id"], name: "index_payment_destinations_on_updated_by_id"
    t.index ["user_id"], name: "index_payment_destinations_on_user_id"
  end

  create_table "payment_detail_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "payment_detail_id", null: false
    t.integer "department_id"
    t.string "description", null: false
    t.string "amount", default: "0", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "accounting_item_id"
    t.date "day"
    t.index ["accounting_item_id"], name: "index_payment_detail_items_on_accounting_item_id"
    t.index ["department_id"], name: "index_payment_detail_items_on_department_id"
    t.index ["payment_detail_id"], name: "index_payment_detail_items_on_payment_detail_id"
  end

  create_table "payment_details", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "payment_header_id", null: false
    t.text "purpose", size: :medium, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["payment_header_id"], name: "index_payment_details_on_payment_header_id"
  end

  create_table "payment_headers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "slip_number", null: false
    t.integer "user_id", null: false
    t.date "applied_on", null: false
    t.date "will_pay_on"
    t.integer "payment_destination_id"
    t.integer "status", limit: 1, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "finished", default: false, null: false
    t.integer "company_bank_account_id"
    t.integer "accounting_item_id"
    t.integer "division_shop_id"
    t.integer "division_project_id"
    t.integer "division_customer_id"
    t.integer "division_evaluated_id"
    t.string "reason"
    t.integer "expense_file_id"
    t.boolean "paper_document", default: false, null: false
    t.integer "credit_department_id"
    t.integer "ringi_kkb_id"
    t.integer "project_kkb_id"
    t.string "bank_comment"
    t.date "payed_on"
    t.integer "payment_source", limit: 1
    t.index ["accounting_item_id"], name: "index_payment_headers_on_accounting_item_id"
    t.index ["company_bank_account_id"], name: "index_payment_headers_on_company_bank_account_id"
    t.index ["created_by_id"], name: "index_payment_headers_on_created_by_id"
    t.index ["credit_department_id"], name: "index_payment_headers_on_credit_department_id"
    t.index ["division_customer_id"], name: "index_payment_headers_on_division_customer_id"
    t.index ["division_evaluated_id"], name: "index_payment_headers_on_division_evaluated_id"
    t.index ["division_project_id"], name: "index_payment_headers_on_division_project_id"
    t.index ["division_shop_id"], name: "index_payment_headers_on_division_shop_id"
    t.index ["expense_file_id"], name: "index_payment_headers_on_expense_file_id"
    t.index ["payment_destination_id"], name: "index_payment_headers_on_payment_destination_id"
    t.index ["slip_number"], name: "index_payment_headers_on_slip_number", unique: true
    t.index ["updated_by_id"], name: "index_payment_headers_on_updated_by_id"
    t.index ["user_id"], name: "index_payment_headers_on_user_id"
  end

  create_table "performance_appeals", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.integer "user_id", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "remark"
    t.index ["created_by_id"], name: "index_performance_appeals_on_created_by_id"
    t.index ["day", "department_id", "data_type"], name: "index_performance_appeals"
    t.index ["department_id"], name: "index_performance_appeals_on_department_id"
    t.index ["updated_by_id"], name: "index_performance_appeals_on_updated_by_id"
    t.index ["user_id"], name: "index_performance_appeals_on_user_id"
  end

  create_table "personal_contacts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "contact_name", null: false
    t.string "company_name"
    t.string "email", null: false
    t.string "comment"
    t.boolean "enabled", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_personal_contacts_on_user_id"
  end

  create_table "personnel_change_procs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "user_id"
    t.integer "change_type"
    t.datetime "fixed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "user_id", "change_type"], name: "index_personnel_change_procs_on_day_and_user_id_and_change_type", unique: true
    t.index ["user_id"], name: "index_personnel_change_procs_on_user_id"
  end

  create_table "personnel_changes", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.integer "change_type", limit: 1, null: false
    t.date "change_date"
    t.string "name"
    t.string "kana"
    t.integer "job_type", limit: 1
    t.integer "employment"
    t.date "final_date"
    t.integer "move_from_id"
    t.integer "move_to_id"
    t.string "nearest_station"
    t.integer "count_ph"
    t.integer "count_ow"
    t.integer "area_id"
    t.string "koma_before"
    t.string "koma_after"
    t.text "memo", size: :medium
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "start_date"
    t.string "change_text"
    t.index ["area_id"], name: "index_personnel_changes_on_area_id"
    t.index ["created_by_id"], name: "index_personnel_changes_on_created_by_id"
    t.index ["move_from_id"], name: "index_personnel_changes_on_move_from_id"
    t.index ["move_to_id"], name: "index_personnel_changes_on_move_to_id"
    t.index ["updated_by_id"], name: "index_personnel_changes_on_updated_by_id"
    t.index ["user_id"], name: "index_personnel_changes_on_user_id"
  end

  create_table "pharmacist_workflow_statuses", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "department_id"], name: "index_pharmacist_workflow_statuses", unique: true
    t.index ["department_id"], name: "index_pharmacist_workflow_statuses_on_department_id"
  end

  create_table "phones", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "number", null: false
    t.string "mail", null: false
    t.date "started_at"
    t.date "finished_at"
    t.date "renew_at"
    t.integer "price_flat"
    t.integer "price_once"
    t.integer "data_type", limit: 1, null: false
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.integer "department_id"
    t.string "owner"
    t.index ["department_id"], name: "index_phones_on_department_id"
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "positions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position_class"
    t.integer "sort_order"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "prescription_average_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "prescription_average_id", null: false
    t.integer "time_slot"
    t.integer "count"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["prescription_average_id", "time_slot"], name: "prescription_average_values_index", unique: true
    t.index ["prescription_average_id"], name: "index_prescription_average_values_on_prescription_average_id"
  end

  create_table "prescription_averages", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "form_type", limit: 1, null: false
    t.string "title", limit: 20
    t.boolean "sun"
    t.boolean "mon"
    t.boolean "tue"
    t.boolean "wed"
    t.boolean "thu"
    t.boolean "fri"
    t.boolean "sat"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id"], name: "index_prescription_averages_on_department_id"
  end

  create_table "prescription_dailies", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "department_id"
    t.integer "number"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "department_id"], name: "index_prescription_dailies_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_prescription_dailies_on_department_id"
  end

  create_table "prescription_monthlies", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "month", null: false
    t.integer "department_id", null: false
    t.integer "business_day_count", default: 0, null: false
    t.integer "prescription_total", default: 0, null: false
    t.integer "prescription_reduce", default: 0, null: false
    t.integer "business_day_total", default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.string "message"
    t.index ["created_by_id"], name: "index_prescription_monthlies_on_created_by_id"
    t.index ["department_id"], name: "index_prescription_monthlies_on_department_id"
    t.index ["month", "department_id"], name: "index_prescription_monthlies", unique: true
    t.index ["updated_by_id"], name: "index_prescription_monthlies_on_updated_by_id"
  end

  create_table "prescription_time_zones", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "time_zone", null: false
    t.integer "count", default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_prescription_time_zones_on_created_by_id"
    t.index ["day", "department_id", "time_zone"], name: "index_prescription_time_zones", unique: true
    t.index ["department_id"], name: "index_prescription_time_zones_on_department_id"
    t.index ["updated_by_id"], name: "index_prescription_time_zones_on_updated_by_id"
  end

  create_table "prescription_years", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "year", null: false
    t.integer "number1", default: 0, null: false
    t.integer "number2", default: 0, null: false
    t.integer "number3", default: 0, null: false
    t.integer "day_number", default: 0, null: false
    t.integer "average_number", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "day"
    t.index ["department_id", "year", "day"], name: "idx_dep_year_day", unique: true
    t.index ["department_id"], name: "index_prescription_years_on_department_id"
  end

  create_table "priority_task_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.boolean "hidden", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "priority_tasks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "title"
    t.text "remark", size: :medium
    t.integer "user_id"
    t.integer "status", limit: 1, default: 1, null: false
    t.integer "checker_id"
    t.string "email"
    t.integer "kkb_category_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "stage", limit: 1
    t.string "comment"
    t.integer "priority_task_category_id"
    t.date "day"
    t.integer "data_type", limit: 1, default: 1, null: false
    t.integer "kkb_id"
    t.time "start_time"
    t.time "finish_time"
    t.index ["checker_id"], name: "index_priority_tasks_on_checker_id"
    t.index ["kkb_category_id"], name: "index_priority_tasks_on_kkb_category_id"
    t.index ["kkb_id"], name: "index_priority_tasks_on_kkb_id"
    t.index ["priority_task_category_id"], name: "index_priority_tasks_on_priority_task_category_id"
    t.index ["user_id"], name: "index_priority_tasks_on_user_id"
  end

  create_table "promise_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "requested_by_id", null: false
    t.integer "promise_type", limit: 1, null: false
    t.date "dated_from"
    t.date "dated_to"
    t.integer "amount"
    t.integer "repetition", limit: 1, null: false
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "func_def_id", null: false
    t.text "func_params"
    t.integer "created_by_id", null: false
    t.integer "promise_target_id", null: false
    t.text "condition"
    t.index ["created_by_id"], name: "index_promise_items_on_created_by_id"
    t.index ["func_def_id"], name: "index_promise_items_on_func_def_id"
    t.index ["promise_target_id"], name: "index_promise_items_on_promise_target_id"
    t.index ["requested_by_id"], name: "index_promise_items_on_requested_by_id"
    t.index ["updated_by_id"], name: "index_promise_items_on_updated_by_id"
    t.index ["user_id"], name: "index_promise_items_on_user_id"
  end

  create_table "promise_procs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "promise_target_id", null: false
    t.date "dated_on", null: false
    t.integer "status", limit: 1, null: false
    t.integer "amount"
    t.integer "confirmed_by_id"
    t.integer "func_value", limit: 1, null: false
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["confirmed_by_id"], name: "index_promise_procs_on_confirmed_by_id"
    t.index ["promise_target_id", "dated_on"], name: "index_promise_procs_on_promise_target_id_and_dated_on", unique: true
    t.index ["promise_target_id"], name: "index_promise_procs_on_promise_target_id"
  end

  create_table "promise_targets", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "status", limit: 1, default: 1, null: false
    t.integer "kkb_id", null: false
    t.integer "created_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "check_user", default: false
    t.boolean "check_request_user", default: false
    t.index ["created_by_id"], name: "index_promise_targets_on_created_by_id"
    t.index ["kkb_id"], name: "index_promise_targets_on_kkb_id"
  end

  create_table "prospective_employees", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_section", limit: 1, null: false
    t.integer "entry_type", limit: 1, null: false
    t.string "name_last", null: false
    t.string "name_first", null: false
    t.string "kana_last"
    t.string "kana_first"
    t.string "code"
    t.date "entry_on"
    t.date "transfer_on"
    t.integer "company_id"
    t.integer "former_company_id"
    t.integer "job_type", limit: 1
    t.integer "employment", limit: 1
    t.integer "course_type", limit: 1
    t.date "job_start_on"
    t.date "job_end_on"
    t.integer "department_id"
    t.boolean "multiple_departments", default: false, null: false
    t.text "take_over_notes", size: :medium
    t.boolean "by_train", default: false, null: false
    t.boolean "by_bus", default: false, null: false
    t.boolean "by_car", default: false, null: false
    t.boolean "by_motorcycle", default: false, null: false
    t.boolean "by_bicycle", default: false, null: false
    t.boolean "on_foot", default: false, null: false
    t.boolean "commuting_expense", default: true, null: false
    t.boolean "health_insurance", default: true, null: false
    t.integer "tax_exemption_type", limit: 1
    t.integer "dependent_type", limit: 1
    t.integer "payment_closing_day"
    t.integer "payment_month", limit: 1
    t.integer "payment_day"
    t.text "payment_notes", size: :medium
    t.text "special_notes", size: :medium
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "before_entry_on"
    t.integer "user_id"
    t.date "applied_on"
    t.text "reason", size: :medium
    t.integer "monthly_work_count"
    t.string "work_time_comment"
    t.boolean "welfare_pension", default: true, null: false
    t.boolean "employment_insurance", default: true, null: false
    t.integer "weekly_work_count"
    t.boolean "hidden", default: false, null: false
    t.string "recruiter"
    t.string "rest_time_comment"
    t.integer "work_hour_type", limit: 1
    t.boolean "two_day_off", default: false, null: false
    t.integer "salary_category_id"
    t.integer "area_id"
    t.boolean "renewal_limit", default: false, null: false
    t.integer "renewal_count_max"
    t.integer "contract_years_max"
    t.boolean "change_contract", default: false, null: false
    t.integer "deployment_id"
    t.integer "user_segment_id"
    t.integer "user_role_id"
    t.integer "user_division_id"
    t.integer "salary_type_id"
    t.integer "organization_unit_id"
    t.index ["area_id"], name: "index_prospective_employees_on_area_id"
    t.index ["company_id"], name: "index_prospective_employees_on_company_id"
    t.index ["company_section", "entry_type"], name: "prospective_employees_index"
    t.index ["created_by_id"], name: "index_prospective_employees_on_created_by_id"
    t.index ["department_id"], name: "index_prospective_employees_on_department_id"
    t.index ["deployment_id"], name: "index_prospective_employees_on_deployment_id"
    t.index ["former_company_id"], name: "index_prospective_employees_on_former_company_id"
    t.index ["organization_unit_id"], name: "index_prospective_employees_on_organization_unit_id"
    t.index ["salary_category_id"], name: "index_prospective_employees_on_salary_category_id"
    t.index ["salary_type_id"], name: "index_prospective_employees_on_salary_type_id"
    t.index ["updated_by_id"], name: "index_prospective_employees_on_updated_by_id"
    t.index ["user_division_id"], name: "index_prospective_employees_on_user_division_id"
    t.index ["user_id"], name: "index_prospective_employees_on_user_id"
    t.index ["user_role_id"], name: "index_prospective_employees_on_user_role_id"
    t.index ["user_segment_id"], name: "index_prospective_employees_on_user_segment_id"
  end

  create_table "prospective_payments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "prospective_employee_id", null: false
    t.integer "basic_salary"
    t.integer "ability_allowance"
    t.integer "comprehensive_allowance"
    t.integer "achievement_allowance"
    t.integer "hourly_wage"
    t.integer "daily_wage"
    t.integer "half_daily_wage"
    t.integer "bonus_times"
    t.integer "former_annual_salary"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "bonus_amount"
    t.integer "housing_allowance"
    t.integer "overtime_allowance"
    t.integer "expected_overtime_allowance"
    t.integer "pharmacist_allowance"
    t.integer "registered_sales_allowance"
    t.integer "regional_allowance"
    t.integer "administrative_allowance"
    t.integer "variable_allowance"
    t.integer "fixed_allowance"
    t.integer "incentive_allowance"
    t.integer "supervisor_allowance"
    t.string "general_allowance_name"
    t.integer "general_allowance"
    t.boolean "include_overtime", default: true, null: false
    t.integer "overtime_hours"
    t.integer "comprehensive_allowance_1"
    t.integer "comprehensive_allowance_2"
    t.integer "professional_allowance_1"
    t.integer "professional_allowance_2"
    t.string "variable_allowance_comment"
    t.string "fixed_allowance_comment"
    t.integer "special_allowance"
    t.integer "special_duty_allowance"
    t.integer "special_ability_allowance"
    t.index ["created_by_id"], name: "index_prospective_payments_on_created_by_id"
    t.index ["prospective_employee_id"], name: "index_prospective_payments_on_prospective_employee_id", unique: true
    t.index ["updated_by_id"], name: "index_prospective_payments_on_updated_by_id"
  end

  create_table "prospective_work_hours", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "prospective_employee_id", null: false
    t.integer "wday", limit: 1, null: false
    t.time "start_at"
    t.time "end_at"
    t.integer "rest_time"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_prospective_work_hours_on_created_by_id"
    t.index ["prospective_employee_id", "wday"], name: "prospective_work_hours_index", unique: true
    t.index ["prospective_employee_id"], name: "index_prospective_work_hours_on_prospective_employee_id"
    t.index ["updated_by_id"], name: "index_prospective_work_hours_on_updated_by_id"
  end

  create_table "questionnaire_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "questionnaire_id"
    t.string "title"
    t.text "remark", size: :medium
    t.integer "item_type"
    t.integer "rank"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "file"
    t.boolean "searchable", default: false, null: false
    t.text "choices", size: :medium
    t.integer "parent_id"
    t.integer "cond_value"
    t.index ["parent_id"], name: "index_questionnaire_items_on_parent_id"
    t.index ["questionnaire_id"], name: "index_questionnaire_items_on_questionnaire_id"
  end

  create_table "questionnaire_kkbs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "questionnaire_id"
    t.integer "kkb_id"
    t.integer "user_id"
    t.integer "status", limit: 1, default: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id"], name: "index_questionnaire_kkbs_on_kkb_id"
    t.index ["questionnaire_id"], name: "index_questionnaire_kkbs_on_questionnaire_id"
    t.index ["user_id"], name: "index_questionnaire_kkbs_on_user_id"
  end

  create_table "questionnaire_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "questionnaire_item_id"
    t.integer "kkb_id"
    t.integer "user_id"
    t.string "file"
    t.integer "number"
    t.string "comment", limit: 2048
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "choices", size: :medium
    t.index ["kkb_id"], name: "index_questionnaire_values_on_kkb_id"
    t.index ["questionnaire_item_id"], name: "index_questionnaire_values_on_questionnaire_item_id"
    t.index ["user_id"], name: "index_questionnaire_values_on_user_id"
  end

  create_table "questionnaires", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "title"
    t.string "code"
    t.text "remark", size: :medium
    t.integer "user_id"
    t.boolean "openness", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "confirm_type", limit: 1, default: 0, null: false
    t.date "limit_date"
    t.text "result_text", size: :medium
    t.index ["code"], name: "index_questionnaires_on_code", unique: true
    t.index ["user_id"], name: "index_questionnaires_on_user_id"
  end

  create_table "recruit_pharmacist_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "recruit_pharmacist_id", null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.string "comment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_recruit_pharmacist_comments_on_created_by_id"
    t.index ["recruit_pharmacist_id"], name: "index_recruit_pharmacist_comments_on_recruit_pharmacist_id"
    t.index ["updated_by_id"], name: "index_recruit_pharmacist_comments_on_updated_by_id"
  end

  create_table "recruit_pharmacist_selections", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "recruit_pharmacist_id", null: false
    t.datetime "browsed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["recruit_pharmacist_id"], name: "index_recruit_pharmacist_selections_on_recruit_pharmacist_id"
    t.index ["user_id", "recruit_pharmacist_id"], name: "index_recruit_pharmacist_selections", unique: true
    t.index ["user_id"], name: "index_recruit_pharmacist_selections_on_user_id"
  end

  create_table "recruit_pharmacists", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "status", limit: 1, default: 1, null: false
    t.date "receipted_date"
    t.integer "interviewer_id"
    t.integer "staff_agency_id"
    t.string "staff_agency_person"
    t.string "shop_info"
    t.date "interview_date"
    t.integer "prefecture", limit: 1
    t.string "condition_info"
    t.date "limit_date"
    t.date "start_date"
    t.integer "map_location_id"
    t.string "user_name"
    t.string "user_age"
    t.integer "user_sex"
    t.string "education_history"
    t.integer "potential", limit: 1
    t.string "annual_income"
    t.boolean "supervisor_possible"
    t.string "user_start_date"
    t.string "user_condition_info"
    t.integer "department_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "number", limit: 8
    t.string "municipality"
    t.integer "kkb_id"
    t.integer "company_section", limit: 1, default: 1, null: false
    t.integer "commutable_by_car", limit: 1
    t.integer "prospective_employee_id"
    t.boolean "attack", default: false, null: false
    t.boolean "design", default: false, null: false
    t.datetime "attack_at", precision: nil
    t.datetime "design_at", precision: nil
    t.integer "recruitment_fee"
    t.integer "area_id"
    t.boolean "office_worker", default: false, null: false
    t.index ["area_id"], name: "index_recruit_pharmacists_on_area_id"
    t.index ["created_by_id"], name: "index_recruit_pharmacists_on_created_by_id"
    t.index ["department_id"], name: "index_recruit_pharmacists_on_department_id"
    t.index ["interviewer_id"], name: "index_recruit_pharmacists_on_interviewer_id"
    t.index ["kkb_id"], name: "index_recruit_pharmacists_on_kkb_id"
    t.index ["map_location_id"], name: "index_recruit_pharmacists_on_map_location_id"
    t.index ["prospective_employee_id"], name: "index_recruit_pharmacists_on_prospective_employee_id"
    t.index ["staff_agency_id"], name: "index_recruit_pharmacists_on_staff_agency_id"
    t.index ["updated_by_id"], name: "index_recruit_pharmacists_on_updated_by_id"
    t.index ["user_id"], name: "index_recruit_pharmacists_on_user_id"
  end

  create_table "recruit_shift_designs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "recruit_pharmacist_id", null: false
    t.integer "wday", limit: 1, null: false
    t.integer "roster_type", limit: 1
    t.integer "destination_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_recruit_shift_designs_on_created_by_id"
    t.index ["destination_id"], name: "index_recruit_shift_designs_on_destination_id"
    t.index ["recruit_pharmacist_id", "wday"], name: "recruit_shift_designs_index", unique: true
    t.index ["recruit_pharmacist_id"], name: "index_recruit_shift_designs_on_recruit_pharmacist_id"
    t.index ["updated_by_id"], name: "index_recruit_shift_designs_on_updated_by_id"
  end

  create_table "region_daily_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "region_id", null: false
    t.date "day", null: false
    t.integer "comment_type", limit: 1, null: false
    t.text "text", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_region_daily_comments_on_created_by_id"
    t.index ["region_id", "day", "comment_type"], name: "region_daily_comments_index", unique: true
    t.index ["region_id"], name: "index_region_daily_comments_on_region_id"
    t.index ["updated_by_id"], name: "index_region_daily_comments_on_updated_by_id"
  end

  create_table "region_staff_summaries", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "region_id", null: false
    t.integer "job_type", limit: 1, null: false
    t.float "reserve_capacity", default: 0.0, null: false
    t.text "json", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "summary_type", limit: 1, default: 1, null: false
    t.index ["day", "region_id", "job_type", "summary_type"], name: "region_staff_summaries_day_reg_job_summary_index", unique: true
    t.index ["region_id"], name: "index_region_staff_summaries_on_region_id"
  end

  create_table "regions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "rank"
    t.boolean "enable_user", default: false
    t.boolean "enable_dept", default: false
    t.boolean "enable_shift", default: false
    t.boolean "enable_summary", default: false
    t.index ["code"], name: "index_regions_on_code", unique: true
  end

  create_table "registered_commuting_options", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "option_type", limit: 1, default: 1, null: false
    t.integer "user_id", null: false
    t.integer "department_id", null: false
    t.integer "accepted_by_id", null: false
    t.date "accept_date", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["accepted_by_id"], name: "index_registered_commuting_options_on_accepted_by_id"
    t.index ["department_id"], name: "index_registered_commuting_options_on_department_id"
    t.index ["user_id", "department_id"], name: "index_registered_commuting_options_on_user_id_and_department_id", unique: true
    t.index ["user_id"], name: "index_registered_commuting_options_on_user_id"
  end

  create_table "registered_pharmacists", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.integer "data_type"
    t.date "registered_on"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "status"
    t.date "deleted_on"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.float "work_hour", default: 0.0, null: false
    t.boolean "assigned", default: false, null: false
    t.boolean "immediately", default: false, null: false
    t.index ["created_by_id"], name: "index_registered_pharmacists_on_created_by_id"
    t.index ["department_id"], name: "index_registered_pharmacists_on_department_id"
    t.index ["updated_by_id"], name: "index_registered_pharmacists_on_updated_by_id"
    t.index ["user_id", "department_id"], name: "index_registered_pharmacists_on_user_id_and_department_id", unique: true
    t.index ["user_id"], name: "index_registered_pharmacists_on_user_id"
  end

  create_table "reibai_shifts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "period_type", limit: 1, null: false
    t.integer "user_id"
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "department_id"], name: "index_reibai_shifts_on_day_and_department_id"
    t.index ["department_id"], name: "index_reibai_shifts_on_department_id"
    t.index ["user_id"], name: "index_reibai_shifts_on_user_id"
  end

  create_table "reibai_stores", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "priority", limit: 1, null: false
    t.date "start_on"
    t.date "end_on"
    t.integer "openable_count"
    t.integer "required_count"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "year", null: false
    t.index ["created_by_id"], name: "index_reibai_stores_on_created_by_id"
    t.index ["department_id"], name: "fk_rails_cd668f93e9"
    t.index ["updated_by_id"], name: "index_reibai_stores_on_updated_by_id"
    t.index ["year", "department_id"], name: "index_reibai_stores_on_year_and_department_id", unique: true
  end

  create_table "release_info_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "release_info_id", null: false
    t.integer "user_id", null: false
    t.datetime "confirmed_at", precision: nil
    t.index ["release_info_id", "user_id"], name: "index_release_info_users_on_release_info_id_and_user_id", unique: true
    t.index ["release_info_id"], name: "index_release_info_users_on_release_info_id"
    t.index ["user_id"], name: "index_release_info_users_on_user_id"
  end

  create_table "release_infos", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "controller", null: false
    t.string "action", null: false
    t.date "released_on", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["controller", "action", "released_on"], name: "index_release_infos_on_controller_and_action_and_released_on", unique: true
    t.index ["created_by_id"], name: "index_release_infos_on_created_by_id"
    t.index ["updated_by_id"], name: "index_release_infos_on_updated_by_id"
  end

  create_table "reserve_capacities", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "count", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "reserve_capacity_dailies", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "region_id", null: false
    t.integer "count", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "scramble", default: 0, null: false
    t.index ["day", "region_id"], name: "reserve_capacity_daily_index", unique: true
    t.index ["region_id"], name: "index_reserve_capacity_dailies_on_region_id"
  end

  create_table "reserve_capacity_regions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "reserve_capacity_id", null: false
    t.integer "region_id", null: false
    t.index ["region_id"], name: "index_reserve_capacity_regions_on_region_id"
    t.index ["reserve_capacity_id", "region_id"], name: "reserve_capacity_region_index", unique: true
    t.index ["reserve_capacity_id"], name: "index_reserve_capacity_regions_on_reserve_capacity_id"
  end

  create_table "rest_time_cards", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "time_record_id", null: false
    t.integer "department_id", null: false
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil
    t.index ["department_id"], name: "index_rest_time_cards_on_department_id"
    t.index ["time_record_id"], name: "index_rest_time_cards_on_time_record_id"
  end

  create_table "rest_times", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_rest_times_on_created_by_id"
    t.index ["day", "user_id"], name: "index_rest_times_on_day_and_user_id", unique: true
    t.index ["updated_by_id"], name: "index_rest_times_on_updated_by_id"
    t.index ["user_id"], name: "index_rest_times_on_user_id"
  end

  create_table "resume_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "example"
    t.date "start_on"
    t.date "end_on"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "month_required", default: false, null: false
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_resume_items_on_parent_id"
  end

  create_table "resume_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "resume_item_id", null: false
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "month"
    t.index ["resume_item_id"], name: "index_resume_values_on_resume_item_id"
    t.index ["user_id", "resume_item_id"], name: "index_resume_values_on_user_id_and_resume_item_id"
    t.index ["user_id"], name: "index_resume_values_on_user_id"
  end

  create_table "riding_times", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "location_from_id"
    t.integer "location_to_id"
    t.integer "time_on_board", limit: 2
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "server_type", limit: 1, null: false
    t.integer "distance", limit: 2
    t.boolean "success"
    t.integer "time_walk", limit: 2, default: 0, null: false
    t.integer "time_other", limit: 2, default: 0, null: false
    t.string "comment"
    t.index ["location_from_id", "location_to_id"], name: "index_riding_times_on_location_from_id_and_location_to_id", unique: true
    t.index ["location_from_id"], name: "index_riding_times_on_location_from_id"
    t.index ["location_to_id"], name: "index_riding_times_on_location_to_id"
  end

  create_table "roster_area_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "area_id"
    t.integer "job_type", limit: 1, default: 1, null: false
    t.string "comment", limit: 512
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type", limit: 1, default: 1, null: false
    t.index ["area_id"], name: "index_roster_area_comments_on_area_id"
    t.index ["day", "job_type", "area_id", "data_type"], name: "idx_roster_area_comments_on_day_job_type_area_data_type", unique: true
  end

  create_table "roster_area_defaults", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "area_id"
    t.integer "paid_holiday", limit: 1, default: 0, null: false
    t.integer "paid_holiday_f", limit: 1, default: 0, null: false
    t.integer "paid_holiday_p", limit: 1, default: 0, null: false
    t.integer "abrupt_holiday", limit: 1, default: 0, null: false
    t.integer "haken_count", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "job_type", limit: 1, default: 1, null: false
    t.index ["area_id", "job_type"], name: "index_roster_area_defaults_on_area_id_and_job_type", unique: true
    t.index ["area_id"], name: "index_roster_area_defaults_on_area_id"
  end

  create_table "roster_areas", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "area_id"
    t.date "day"
    t.integer "paid_holiday", limit: 1, default: 0, null: false
    t.integer "paid_holiday_f", limit: 1, default: 0, null: false
    t.integer "paid_holiday_p", limit: 1, default: 0, null: false
    t.integer "abrupt_holiday", limit: 1, default: 0, null: false
    t.integer "haken_count", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "job_type", limit: 1, default: 1, null: false
    t.integer "comp_holiday", limit: 1, default: 0, null: false
    t.index ["area_id"], name: "index_roster_areas_on_area_id"
    t.index ["day", "area_id", "job_type"], name: "index_roster_areas_on_day_and_area_id_and_job_type", unique: true
  end

  create_table "roster_diff_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.integer "edit_user_id"
    t.string "comment", limit: 512
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "department_id"], name: "index_roster_diff_comments_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_roster_diff_comments_on_department_id"
    t.index ["edit_user_id"], name: "fk_rails_71c078943b"
  end

  create_table "roster_shop_procs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "user_id"
    t.integer "department_id"
    t.integer "status", limit: 1, default: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "department_id"], name: "index_roster_shop_procs_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_roster_shop_procs_on_department_id"
    t.index ["user_id"], name: "index_roster_shop_procs_on_user_id"
  end

  create_table "roster_shops", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.bigint "department_id"
    t.integer "pharmacist_count", limit: 1, default: 0, null: false
    t.integer "office_worker_count", limit: 1, default: 0, null: false
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "area_id"
    t.integer "count_pass", limit: 1, default: 0, null: false
    t.integer "count_batsu", limit: 1, default: 0, null: false
    t.integer "count_k", limit: 1, default: 0, null: false
    t.integer "count_pass_ow", limit: 1, default: 0, null: false
    t.integer "count_batsu_ow", limit: 1, default: 0, null: false
    t.index ["area_id"], name: "index_roster_shops_on_area_id"
    t.index ["day", "department_id"], name: "index_roster_shops_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_roster_shops_on_department_id"
  end

  create_table "roster_summaries", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "area_id"
    t.integer "job_type", limit: 1
    t.integer "count_shop", default: 0, null: false
    t.integer "count_user", default: 0, null: false
    t.integer "count_nkk", default: 0, null: false
    t.integer "count_p", default: 0, null: false
    t.integer "count_x", default: 0, null: false
    t.integer "count_k", default: 0, null: false
    t.integer "paid_holiday", default: 0, null: false
    t.boolean "modified", default: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "count_nkk_ids", limit: 512
    t.text "count_user_ids", size: :medium
    t.string "count_moved_from_ids"
    t.string "count_moved_to_ids"
    t.integer "over_frame", default: 0, null: false
    t.integer "nonshift_work", default: 0, null: false
    t.string "nonshift_work_ids"
    t.index ["area_id"], name: "index_roster_summaries_on_area_id"
    t.index ["day", "area_id", "job_type"], name: "index_roster_summaries_on_day_and_area_id_and_job_type", unique: true
  end

  create_table "roster_user_procs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "user_id"
    t.integer "status", limit: 1, default: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "checker_id"
    t.integer "status_checker", limit: 1, default: 1, null: false
    t.boolean "modified_legal_holiday", default: false
    t.string "comment"
    t.integer "reason", limit: 1
    t.string "comment_checker"
    t.index ["day", "user_id"], name: "index_roster_user_procs_on_day_and_user_id", unique: true
    t.index ["user_id"], name: "index_roster_user_procs_on_user_id"
  end

  create_table "roster_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "user_id"
    t.integer "department_id"
    t.integer "roster_type", limit: 1, default: 1, null: false
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "frame_type", limit: 1, default: 1, null: false
    t.integer "period_type", limit: 1, default: 0, null: false
    t.boolean "modified", default: false, null: false
    t.boolean "manager_day", default: false, null: false
    t.boolean "nkk", default: false, null: false
    t.integer "updated_by_id"
    t.boolean "at_home", default: false, null: false
    t.index ["day", "user_id", "period_type"], name: "index_roster_users_on_day_and_user_id_and_period_type", unique: true
    t.index ["department_id"], name: "index_roster_users_on_department_id"
    t.index ["updated_by_id"], name: "index_roster_users_on_updated_by_id"
    t.index ["user_id"], name: "index_roster_users_on_user_id"
  end

  create_table "routine_task_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "repeat_type", limit: 1
    t.integer "data_type", limit: 1
    t.integer "limit_wday", limit: 1
    t.integer "limit_day", limit: 1
    t.date "limit_date"
    t.integer "rank"
    t.integer "user_id"
    t.boolean "hidden", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "comment"
    t.integer "group_id"
    t.boolean "mon", default: false
    t.boolean "tue", default: false
    t.boolean "wed", default: false
    t.boolean "thu", default: false
    t.boolean "fri", default: false
    t.boolean "sat", default: false
    t.boolean "sun", default: false
    t.boolean "w1", default: false
    t.boolean "w2", default: false
    t.boolean "w3", default: false
    t.boolean "w4", default: false
    t.boolean "w5", default: false
    t.integer "day", limit: 1
    t.integer "actor_type", limit: 1
    t.integer "actor_id"
    t.boolean "only_once", default: false, null: false
    t.date "once_day"
    t.text "remark", size: :medium
    t.date "start_date"
    t.boolean "editable", default: true, null: false
    t.integer "month", limit: 1
    t.index ["actor_id"], name: "index_routine_task_items_on_actor_id"
    t.index ["group_id"], name: "index_routine_task_items_on_group_id"
    t.index ["user_id"], name: "index_routine_task_items_on_user_id"
  end

  create_table "routine_tasks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "routine_task_item_id"
    t.integer "user_id"
    t.string "file"
    t.date "target_date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "group_id"
    t.integer "status", limit: 1, default: 1, null: false
    t.integer "data_type", limit: 1, default: 0, null: false
    t.string "comment"
    t.string "reason"
    t.integer "checker_id"
    t.string "file2"
    t.string "file3"
    t.index ["checker_id"], name: "index_routine_tasks_on_checker_id"
    t.index ["group_id"], name: "index_routine_tasks_on_group_id"
    t.index ["routine_task_item_id"], name: "index_routine_tasks_on_routine_task_item_id"
    t.index ["user_id"], name: "index_routine_tasks_on_user_id"
  end

  create_table "salary_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.integer "sort_order", default: 0, null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_salary_categories_on_parent_id"
  end

  create_table "salary_category_item_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "salary_category_item_id", null: false
    t.integer "user_id", null: false
    t.date "start_month", null: false
    t.date "end_month"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_salary_category_item_users_on_created_by_id"
    t.index ["salary_category_item_id", "user_id"], name: "salary_category_item_users_index"
    t.index ["salary_category_item_id"], name: "index_salary_category_item_users_on_salary_category_item_id"
    t.index ["updated_by_id"], name: "index_salary_category_item_users_on_updated_by_id"
    t.index ["user_id"], name: "index_salary_category_item_users_on_user_id"
  end

  create_table "salary_category_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "salary_category_id", null: false
    t.string "code", null: false
    t.string "name", null: false
    t.string "description"
    t.integer "amount"
    t.integer "sort_order", default: 0, null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["salary_category_id"], name: "index_salary_category_items_on_salary_category_id"
  end

  create_table "salary_payments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "month", null: false
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.integer "basic_salary"
    t.integer "hourly_wage"
    t.integer "daily_wage"
    t.float "work_hour"
    t.integer "ability_allowance"
    t.integer "comprehensive_allowance"
    t.integer "achievement_allowance"
    t.integer "general_allowance"
    t.integer "comprehensive_allowance_1"
    t.integer "comprehensive_allowance_2"
    t.integer "professional_allowance_1"
    t.integer "professional_allowance_2"
    t.integer "variable_allowance"
    t.integer "fixed_allowance"
    t.integer "other_allowance_a"
    t.integer "other_allowance_b"
    t.integer "bonus_amount"
    t.integer "annual_salary"
    t.integer "overtime_payment"
    t.integer "company_housing"
    t.integer "welfare_expense"
    t.integer "reimbursed_expense"
    t.integer "annual_payment"
    t.integer "staff_discount"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "total_payment"
    t.integer "taxable_payment"
    t.integer "company_welfare_expense"
    t.integer "bonus_apportion"
    t.index ["company_id"], name: "index_salary_payments_on_company_id"
    t.index ["created_by_id"], name: "index_salary_payments_on_created_by_id"
    t.index ["month", "user_id", "company_id"], name: "salary_payments_index", unique: true
    t.index ["updated_by_id"], name: "index_salary_payments_on_updated_by_id"
    t.index ["user_id"], name: "index_salary_payments_on_user_id"
  end

  create_table "salary_revisions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "month", null: false
    t.string "nickname"
    t.string "comment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_salary_revisions_on_created_by_id"
    t.index ["updated_by_id"], name: "index_salary_revisions_on_updated_by_id"
    t.index ["user_id", "month"], name: "salary_revisions_index", unique: true
    t.index ["user_id"], name: "index_salary_revisions_on_user_id"
  end

  create_table "salary_types", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.integer "legal_holidays"
    t.integer "overtime_hours"
    t.boolean "hidden", default: false, null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_salary_types_on_code", unique: true
    t.index ["created_by_id"], name: "index_salary_types_on_created_by_id"
    t.index ["updated_by_id"], name: "index_salary_types_on_updated_by_id"
  end

  create_table "schedules", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "title"
    t.text "comment", size: :medium
    t.integer "user_id"
    t.integer "status"
    t.integer "kkb_id"
    t.date "day"
    t.time "start_time"
    t.time "finish_time"
    t.integer "member_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type"
    t.integer "group_id"
    t.index ["group_id"], name: "index_schedules_on_group_id"
    t.index ["kkb_id"], name: "index_schedules_on_kkb_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "seal_requests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "applied_on", null: false
    t.integer "user_id", null: false
    t.integer "document_type", limit: 1, default: 1, null: false
    t.string "position"
    t.string "title"
    t.string "description"
    t.string "apply_to"
    t.integer "company_id"
    t.integer "representative_id"
    t.integer "seal_type", limit: 1
    t.integer "copies", default: 1
    t.date "sealed_on"
    t.integer "sealed_by_id"
    t.integer "status", limit: 1, default: 0
    t.bigint "transaction_number", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "company2_id"
    t.integer "representative2_id"
    t.integer "seal_type2", limit: 1
    t.integer "company3_id"
    t.integer "representative3_id"
    t.integer "seal_type3", limit: 1
    t.date "will_arrive_on"
    t.string "send_to"
    t.string "seal_text"
    t.index ["company2_id"], name: "index_seal_requests_on_company2_id"
    t.index ["company3_id"], name: "index_seal_requests_on_company3_id"
    t.index ["company_id"], name: "index_seal_requests_on_company_id"
    t.index ["created_by_id"], name: "index_seal_requests_on_created_by_id"
    t.index ["representative2_id"], name: "index_seal_requests_on_representative2_id"
    t.index ["representative3_id"], name: "index_seal_requests_on_representative3_id"
    t.index ["representative_id"], name: "index_seal_requests_on_representative_id"
    t.index ["sealed_by_id"], name: "index_seal_requests_on_sealed_by_id"
    t.index ["transaction_number"], name: "index_seal_requests_on_transaction_number"
    t.index ["updated_by_id"], name: "index_seal_requests_on_updated_by_id"
    t.index ["user_id"], name: "index_seal_requests_on_user_id"
  end

  create_table "self_consumptions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "department_id", null: false
    t.string "item_name", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "cost", default: 0, null: false
    t.integer "price", default: 0, null: false
    t.string "remark"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "tax_rate_type", limit: 1, null: false
    t.index ["created_by_id"], name: "index_self_consumptions_on_created_by_id"
    t.index ["day", "department_id"], name: "index_self_consumptions_on_day_and_department_id"
    t.index ["department_id"], name: "index_self_consumptions_on_department_id"
    t.index ["updated_by_id"], name: "index_self_consumptions_on_updated_by_id"
  end

  create_table "selling_expenses", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "month", null: false
    t.integer "department_id", null: false
    t.integer "accounting_item_id", null: false
    t.integer "business_connection_id", null: false
    t.integer "amount", default: 0, null: false
    t.boolean "applicable", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["accounting_item_id"], name: "index_selling_expenses_on_accounting_item_id"
    t.index ["business_connection_id"], name: "index_selling_expenses_on_business_connection_id"
    t.index ["department_id"], name: "index_selling_expenses_on_department_id"
    t.index ["month", "department_id", "accounting_item_id"], name: "selling_expenses_index"
  end

  create_table "sent_mail_dests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "sent_mail_history_id", null: false
    t.integer "personal_contact_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["personal_contact_id"], name: "index_sent_mail_dests_on_personal_contact_id"
    t.index ["sent_mail_history_id", "personal_contact_id"], name: "sent_mail_dests_index", unique: true
    t.index ["sent_mail_history_id"], name: "index_sent_mail_dests_on_sent_mail_history_id"
  end

  create_table "sent_mail_histories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", size: :medium, null: false
    t.integer "sent_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["sent_by_id"], name: "fk_rails_8be7f4b3ea"
  end

  create_table "shared_document_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shared_document_id", null: false
    t.integer "user_id", null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.text "comment"
    t.datetime "fixed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["shared_document_id", "user_id"], name: "index_shared_document_comments_on_shared_document_id_and_user_id", unique: true
    t.index ["shared_document_id"], name: "index_shared_document_comments_on_shared_document_id"
    t.index ["user_id"], name: "index_shared_document_comments_on_user_id"
  end

  create_table "shared_document_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shared_document_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "index_shared_document_groups_on_group_id"
    t.index ["shared_document_id", "group_id"], name: "index_shared_document_groups_on_shared_document_id_and_group_id", unique: true
    t.index ["shared_document_id"], name: "index_shared_document_groups_on_shared_document_id"
  end

  create_table "shared_documents", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "created_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shared_documents_on_created_by_id"
  end

  create_table "sheet_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.integer "data_type"
    t.string "code"
    t.string "sub_code"
    t.integer "user_id"
    t.integer "group_id"
    t.integer "auth", limit: 1, default: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["data_type", "code", "sub_code"], name: "index_sheet_items_on_data_type_and_code_and_sub_code", unique: true
    t.index ["group_id"], name: "index_sheet_items_on_group_id"
    t.index ["user_id"], name: "index_sheet_items_on_user_id"
  end

  create_table "sheet_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "sheet_item_id", null: false
    t.integer "user_id"
    t.string "code"
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["sheet_item_id", "code"], name: "index_sheet_values_on_sheet_item_id_and_code", unique: true
    t.index ["sheet_item_id"], name: "index_sheet_values_on_sheet_item_id"
    t.index ["user_id"], name: "index_sheet_values_on_user_id"
  end

  create_table "shift_arrangement_details", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_arrangement_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "wday", limit: 1, null: false
    t.integer "period_type", limit: 1, null: false
    t.integer "roster_type", limit: 1
    t.integer "destination_id"
    t.boolean "locked"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_arrangement_details_on_created_by_id"
    t.index ["destination_id"], name: "index_shift_arrangement_details_on_destination_id"
    t.index ["shift_arrangement_id", "data_type", "wday", "period_type"], name: "shift_arrangement_details_index", unique: true
    t.index ["shift_arrangement_id"], name: "index_shift_arrangement_details_on_shift_arrangement_id"
    t.index ["updated_by_id"], name: "index_shift_arrangement_details_on_updated_by_id"
  end

  create_table "shift_arrangements", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "dated_on", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "user_id", null: false
    t.date "started_on", null: false
    t.string "comment"
    t.integer "first_check", limit: 1
    t.string "answer"
    t.integer "second_check", limit: 1
    t.string "final_comment"
    t.boolean "is_design"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_arrangements_on_created_by_id"
    t.index ["dated_on", "data_type", "user_id", "started_on"], name: "shift_arrangements_index"
    t.index ["updated_by_id"], name: "index_shift_arrangements_on_updated_by_id"
    t.index ["user_id"], name: "index_shift_arrangements_on_user_id"
  end

  create_table "shift_backup_details", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_backup_header_id", null: false
    t.date "day", null: false
    t.integer "user_id"
    t.integer "destination_id"
    t.integer "roster_type", limit: 1, null: false
    t.integer "period_type", limit: 1, null: false
    t.integer "frame_type", limit: 1, default: 1, null: false
    t.integer "frame_status", limit: 1, default: 0, null: false
    t.index ["destination_id"], name: "index_shift_backup_details_on_destination_id"
    t.index ["shift_backup_header_id", "day", "user_id", "period_type"], name: "shift_backup_details_index", unique: true
    t.index ["shift_backup_header_id"], name: "index_shift_backup_details_on_shift_backup_header_id"
    t.index ["user_id"], name: "index_shift_backup_details_on_user_id"
  end

  create_table "shift_backup_headers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "job_type", limit: 1, null: false
    t.integer "timing", limit: 1, null: false
    t.date "start_on"
    t.date "end_on"
    t.boolean "finished", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "shift_block_summaries", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "shift_block_id", null: false
    t.integer "available_count", default: 0, null: false
    t.integer "holiday_count", default: 0, null: false
    t.string "holiday_user_ids"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "shift_block_id"], name: "index_shift_block_summaries_on_day_and_shift_block_id", unique: true
    t.index ["shift_block_id"], name: "index_shift_block_summaries_on_shift_block_id"
  end

  create_table "shift_blocks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_shift_blocks_on_code", unique: true
  end

  create_table "shift_busy_days", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "region_id", null: false
    t.integer "created_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "prohibited", default: false, null: false
    t.index ["created_by_id"], name: "index_shift_busy_days_on_created_by_id"
    t.index ["day", "region_id"], name: "index_shift_busy_days_on_day_and_region_id", unique: true
    t.index ["region_id"], name: "index_shift_busy_days_on_region_id"
  end

  create_table "shift_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.integer "rank"
    t.boolean "hidden", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "template_text"
    t.string "template_label"
  end

  create_table "shift_change_event_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "shift_change_event_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id"], name: "index_shift_change_event_groups_on_group_id"
    t.index ["shift_change_event_id"], name: "index_shift_change_event_groups_on_shift_change_event_id"
  end

  create_table "shift_change_event_members", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shift_change_event_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["shift_change_event_id"], name: "index_shift_change_event_members_on_shift_change_event_id"
    t.index ["user_id"], name: "index_shift_change_event_members_on_user_id"
  end

  create_table "shift_change_events", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_type", limit: 1, default: 0, null: false
    t.date "day"
    t.string "comment"
    t.string "arrangement"
    t.date "final_date"
    t.integer "manager_id"
    t.date "manager_input_date"
    t.integer "created_by_id"
    t.integer "status", limit: 1, default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "department_id"
    t.boolean "st_check", default: false
    t.boolean "recruitment", default: false
    t.boolean "temporary", default: false
    t.boolean "background_input", default: false
    t.date "completed_on"
    t.index ["created_by_id"], name: "index_shift_change_events_on_created_by_id"
    t.index ["department_id"], name: "index_shift_change_events_on_department_id"
    t.index ["manager_id"], name: "index_shift_change_events_on_manager_id"
    t.index ["user_id"], name: "index_shift_change_events_on_user_id"
  end

  create_table "shift_change_plans", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "dated_on", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "user_id"
    t.integer "department_id"
    t.date "applied_on"
    t.date "absent_on"
    t.integer "status", limit: 1, default: 0, null: false
    t.bigint "transaction_number", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_change_plans_on_created_by_id"
    t.index ["department_id"], name: "index_shift_change_plans_on_department_id"
    t.index ["updated_by_id"], name: "index_shift_change_plans_on_updated_by_id"
    t.index ["user_id"], name: "index_shift_change_plans_on_user_id"
  end

  create_table "shift_count_shots", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.date "saved_on", null: false
    t.integer "area_id", null: false
    t.text "unassigned_user_ids"
    t.text "standby_user_ids"
    t.integer "user_count", limit: 2, null: false
    t.integer "dest_count", limit: 2, null: false
    t.integer "count_h", limit: 2, default: 0, null: false
    t.index ["area_id"], name: "index_shift_count_shots_on_area_id"
    t.index ["saved_on", "day", "area_id"], name: "index_shift_count_shots_on_saved_day_area", unique: true
  end

  create_table "shift_daily_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "dated_on", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "user_id", null: false
    t.string "comment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_daily_comments_on_created_by_id"
    t.index ["dated_on", "data_type", "user_id"], name: "index_shift_daily_comments_on_dated_on_and_data_type_and_user_id", unique: true
    t.index ["updated_by_id"], name: "index_shift_daily_comments_on_updated_by_id"
    t.index ["user_id"], name: "index_shift_daily_comments_on_user_id"
  end

  create_table "shift_design_time_cards", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.integer "rest_time"
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "shift_design_time_record_id", null: false
    t.integer "department_id"
    t.index ["created_by_id"], name: "index_shift_design_time_cards_on_created_by_id"
    t.index ["department_id"], name: "index_shift_design_time_cards_on_department_id"
    t.index ["shift_design_time_record_id"], name: "index_shift_design_time_cards_on_shift_design_time_record_id"
    t.index ["updated_by_id"], name: "index_shift_design_time_cards_on_updated_by_id"
  end

  create_table "shift_design_time_records", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "wday", limit: 1, null: false
    t.integer "prospective_employee_id"
    t.index ["created_by_id"], name: "index_shift_design_time_records_on_created_by_id"
    t.index ["day", "user_id"], name: "index_shift_design_time_records_on_day_and_user_id", unique: true
    t.index ["prospective_employee_id"], name: "index_shift_design_time_records_on_prospective_employee_id"
    t.index ["updated_by_id"], name: "index_shift_design_time_records_on_updated_by_id"
    t.index ["user_id"], name: "index_shift_design_time_records_on_user_id"
  end

  create_table "shift_dest_arrangement_details", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_dest_arrangement_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "wday", limit: 1, null: false
    t.integer "schedule_type", limit: 1
    t.integer "count_ph"
    t.integer "count_ow"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_dest_arrangement_details_on_created_by_id"
    t.index ["shift_dest_arrangement_id", "data_type", "wday"], name: "shift_dest_arrangement_details_index", unique: true
    t.index ["shift_dest_arrangement_id"], name: "shift_dest_arrangement_index"
    t.index ["updated_by_id"], name: "index_shift_dest_arrangement_details_on_updated_by_id"
  end

  create_table "shift_dest_arrangements", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "dated_on", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "destination_id", null: false
    t.date "started_on", null: false
    t.string "comment"
    t.integer "first_check", limit: 1
    t.string "answer"
    t.integer "second_check", limit: 1
    t.string "final_comment"
    t.boolean "is_design"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_dest_arrangements_on_created_by_id"
    t.index ["dated_on", "data_type", "destination_id", "started_on"], name: "shift_dests_arrangements_index"
    t.index ["destination_id"], name: "index_shift_dest_arrangements_on_destination_id"
    t.index ["updated_by_id"], name: "index_shift_dest_arrangements_on_updated_by_id"
  end

  create_table "shift_dest_designs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "destination_id", null: false
    t.boolean "holiday", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "job_type", null: false
    t.integer "count", default: 0, null: false
    t.integer "count_p", default: 0, null: false
    t.integer "count_x", default: 0, null: false
    t.integer "count_k", default: 0, null: false
    t.integer "count_f", default: 0, null: false
    t.integer "count_c", default: 0, null: false
    t.integer "count_half", default: 0, null: false
    t.integer "number_user"
    t.integer "wday", limit: 1
    t.integer "count_am", limit: 1, default: 0, null: false
    t.integer "count_pm", limit: 1, default: 0, null: false
    t.integer "status", limit: 1, default: 10
    t.integer "count_h", default: 0, null: false
    t.integer "count_h_am", limit: 1, default: 0, null: false
    t.integer "count_h_pm", limit: 1, default: 0, null: false
    t.integer "count_c_am", limit: 1, default: 0, null: false
    t.integer "count_c_pm", limit: 1, default: 0, null: false
    t.index ["created_by_id"], name: "fk_rails_dd51d75acf"
    t.index ["day", "destination_id", "job_type", "status"], name: "shift_dest_designs_index", unique: true
    t.index ["destination_id"], name: "index_shift_dest_designs_on_destination_id"
    t.index ["updated_by_id"], name: "fk_rails_a6bc493631"
  end

  create_table "shift_dest_differences", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "destination_id", null: false
    t.integer "job_type", limit: 1, null: false
    t.float "count", default: 0.0, null: false
    t.float "difference", default: 0.0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type", limit: 1, default: 1, null: false
    t.float "exclusion_count", default: 0.0, null: false
    t.index ["created_by_id"], name: "index_shift_dest_differences_on_created_by_id"
    t.index ["day", "destination_id", "job_type", "data_type"], name: "index_shift_dest_differences", unique: true
    t.index ["destination_id"], name: "index_shift_dest_differences_on_destination_id"
    t.index ["updated_by_id"], name: "index_shift_dest_differences_on_updated_by_id"
  end

  create_table "shift_dest_plans", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "destination_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "count_ph", null: false
    t.integer "count_ow", null: false
    t.string "comment"
    t.integer "created_by_id"
    t.integer "confirmed_by_id"
    t.datetime "confirmed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "diff_design", default: false, null: false
    t.integer "default_data_type", limit: 1
    t.index ["confirmed_by_id"], name: "index_shift_dest_plans_on_confirmed_by_id"
    t.index ["created_by_id"], name: "index_shift_dest_plans_on_created_by_id"
    t.index ["day", "destination_id"], name: "index_shift_dest_plans_on_day_and_destination_id", unique: true
    t.index ["destination_id"], name: "index_shift_dest_plans_on_destination_id"
  end

  create_table "shift_dest_shots", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "destination_id", null: false
    t.integer "job_type", null: false
    t.integer "count", default: 0, null: false
    t.integer "count_p", default: 0, null: false
    t.integer "count_x", default: 0, null: false
    t.integer "count_k", default: 0, null: false
    t.integer "count_f", default: 0, null: false
    t.integer "count_c", default: 0, null: false
    t.integer "schedule_type", limit: 1
    t.boolean "diff_design"
    t.string "comment"
    t.datetime "notified_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "count_h", default: 0, null: false
    t.integer "count_am", limit: 1, default: 0, null: false
    t.integer "count_pm", limit: 1, default: 0, null: false
    t.integer "count_h_am", limit: 1, default: 0, null: false
    t.integer "count_h_pm", limit: 1, default: 0, null: false
    t.integer "count_c_am", limit: 1, default: 0, null: false
    t.integer "count_c_pm", limit: 1, default: 0, null: false
    t.index ["day", "destination_id", "job_type"], name: "index_shift_dest_shots_on_day_and_destination_id_and_job_type", unique: true
    t.index ["destination_id"], name: "index_shift_dest_shots_on_destination_id"
  end

  create_table "shift_dests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "destination_id", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "job_type", null: false
    t.integer "count", default: 0, null: false
    t.integer "count_p", default: 0, null: false
    t.integer "count_x", default: 0, null: false
    t.integer "count_k", default: 0, null: false
    t.integer "count_f", default: 0, null: false
    t.integer "count_c", default: 0, null: false
    t.integer "count_half", default: 0, null: false
    t.integer "count_am", limit: 1, default: 0, null: false
    t.integer "count_pm", limit: 1, default: 0, null: false
    t.integer "generated_from", limit: 1
    t.integer "status", limit: 1, default: 10
    t.integer "count_h", default: 0, null: false
    t.integer "count_h_am", limit: 1, default: 0, null: false
    t.integer "count_h_pm", limit: 1, default: 0, null: false
    t.integer "count_c_am", limit: 1, default: 0, null: false
    t.integer "count_c_pm", limit: 1, default: 0, null: false
    t.index ["created_by_id"], name: "fk_rails_1be602b71f"
    t.index ["day", "destination_id", "job_type", "status"], name: "shift_dests_index", unique: true
    t.index ["destination_id"], name: "index_shift_dests_on_destination_id"
    t.index ["updated_by_id"], name: "fk_rails_d59ce49de1"
  end

  create_table "shift_haken_months", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.date "month"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["kkb_id"], name: "index_shift_haken_months_on_kkb_id"
  end

  create_table "shift_haken_shops", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "shift_haken_id"
    t.integer "haken_shop_id"
    t.integer "area"
    t.integer "rank"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["haken_shop_id"], name: "index_shift_haken_shops_on_haken_shop_id"
    t.index ["shift_haken_id"], name: "index_shift_haken_shops_on_shift_haken_id"
  end

  create_table "shift_haken_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "shift_haken_id"
    t.integer "user_id"
    t.integer "haken_shop_id"
    t.date "date"
    t.integer "area"
    t.integer "rank"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["haken_shop_id"], name: "index_shift_haken_users_on_haken_shop_id"
    t.index ["shift_haken_id"], name: "index_shift_haken_users_on_shift_haken_id"
    t.index ["user_id"], name: "index_shift_haken_users_on_user_id"
  end

  create_table "shift_hakens", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "kkb_id"
    t.integer "user_id"
    t.integer "status"
    t.date "first_day"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "comment", size: :medium
    t.index ["kkb_id"], name: "index_shift_hakens_on_kkb_id"
    t.index ["user_id"], name: "index_shift_hakens_on_user_id"
  end

  create_table "shift_holiday_helps", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_user_id", null: false
    t.integer "destination_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["destination_id"], name: "index_shift_holiday_helps_on_destination_id"
    t.index ["shift_user_id", "destination_id"], name: "index_shift_holiday_helps_on_shift_user_id_and_destination_id", unique: true
    t.index ["shift_user_id"], name: "index_shift_holiday_helps_on_shift_user_id"
  end

  create_table "shift_management_groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "shift_management_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id"], name: "index_shift_management_groups_on_group_id"
    t.index ["shift_management_id"], name: "index_shift_management_groups_on_shift_management_id"
  end

  create_table "shift_management_members", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shift_management_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["shift_management_id"], name: "index_shift_management_members_on_shift_management_id"
    t.index ["user_id"], name: "index_shift_management_members_on_user_id"
  end

  create_table "shift_managements", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day"
    t.integer "area_id"
    t.string "comment"
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.string "action"
    t.date "action_date"
    t.integer "shift_category_id"
    t.date "work_date"
    t.string "complement"
    t.string "person1"
    t.string "person2"
    t.boolean "duty_to_report", default: true, null: false
    t.integer "region_id"
    t.integer "table_type", limit: 1
    t.boolean "stocked", default: false
    t.date "completed_on"
    t.index ["area_id"], name: "index_shift_managements_on_area_id"
    t.index ["region_id"], name: "index_shift_managements_on_region_id"
    t.index ["shift_category_id"], name: "index_shift_managements_on_shift_category_id"
    t.index ["updated_by_id"], name: "index_shift_managements_on_updated_by_id"
  end

  create_table "shift_notifications", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.datetime "notified_at", precision: nil, null: false
    t.date "dated_on", null: false
    t.integer "company_section", limit: 1, null: false
    t.integer "job_type", limit: 1, null: false
    t.index ["dated_on", "company_section", "job_type"], name: "date_company_job_type", unique: true
  end

  create_table "shift_operations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.string "op_type", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "created_by_id", null: false
    t.index ["created_by_id"], name: "index_shift_operations_on_created_by_id"
  end

  create_table "shift_priorities", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "destination_id", null: false
    t.integer "data_type", limit: 1, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "rank", limit: 1
    t.string "comment"
    t.index ["destination_id"], name: "index_shift_priorities_on_destination_id"
    t.index ["user_id", "destination_id", "data_type"], name: "shift_priorities_index", unique: true
    t.index ["user_id"], name: "index_shift_priorities_on_user_id"
  end

  create_table "shift_proc_chain_nodes", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_proc_chain_id", null: false
    t.integer "prev_node_id"
    t.integer "shift_user_id", null: false
    t.index ["prev_node_id"], name: "index_shift_proc_chain_nodes_on_prev_node_id"
    t.index ["shift_proc_chain_id"], name: "index_shift_proc_chain_nodes_on_shift_proc_chain_id"
    t.index ["shift_user_id"], name: "index_shift_proc_chain_nodes_on_shift_user_id"
  end

  create_table "shift_proc_chains", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_user_id", null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.string "comment"
    t.integer "created_by_id", null: false
    t.integer "confirmed_by_id"
    t.datetime "confirmed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["confirmed_by_id"], name: "index_shift_proc_chains_on_confirmed_by_id"
    t.index ["created_by_id"], name: "index_shift_proc_chains_on_created_by_id"
    t.index ["shift_user_id"], name: "index_shift_proc_chains_on_shift_user_id"
  end

  create_table "shift_request_changes", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_request_id", null: false
    t.integer "user_id", null: false
    t.integer "destination_id", null: false
    t.integer "period_type", limit: 1, default: 0, null: false
    t.integer "rank", limit: 1, null: false
    t.integer "group_number", limit: 1, default: 0, null: false
    t.index ["destination_id"], name: "index_shift_request_changes_on_destination_id"
    t.index ["shift_request_id"], name: "index_shift_request_changes_on_shift_request_id"
    t.index ["user_id"], name: "index_shift_request_changes_on_user_id"
  end

  create_table "shift_request_dest_counts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_request_id", null: false
    t.integer "destination_id", null: false
    t.integer "count", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "count_am", limit: 1, default: 0, null: false
    t.integer "count_pm", limit: 1, default: 0, null: false
    t.index ["destination_id"], name: "index_shift_request_dest_counts_on_destination_id"
    t.index ["shift_request_id", "destination_id"], name: "shift_request_dest_counts_req_dest_index", unique: true
    t.index ["shift_request_id"], name: "index_shift_request_dest_counts_on_shift_request_id"
  end

  create_table "shift_request_dests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_request_id", null: false
    t.integer "prev_count_ph", default: 0, null: false
    t.integer "prev_count_ow", default: 0, null: false
    t.integer "count_ph", default: 0, null: false
    t.integer "count_ow", default: 0, null: false
    t.integer "schedule_type", default: 0, null: false
    t.index ["shift_request_id"], name: "index_shift_request_dests_on_shift_request_id"
  end

  create_table "shift_request_procs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_request_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "free_users_info"
    t.index ["shift_request_id"], name: "index_shift_request_procs_on_shift_request_id"
  end

  create_table "shift_request_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_request_id", null: false
    t.integer "shift_user_id", null: false
    t.integer "destination_id"
    t.integer "period_type", limit: 1
    t.integer "roster_type", limit: 1
    t.datetime "created_at", precision: nil, null: false
    t.integer "frame_type", limit: 1
    t.index ["destination_id"], name: "index_shift_request_users_on_destination_id"
    t.index ["shift_request_id"], name: "index_shift_request_users_on_shift_request_id"
    t.index ["shift_user_id"], name: "index_shift_request_users_on_shift_user_id"
  end

  create_table "shift_requests", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id"
    t.integer "data_type", limit: 1, null: false
    t.integer "destination_id"
    t.integer "status", limit: 1
    t.string "comment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "confirmed_by_id"
    t.integer "approved_by_id"
    t.string "petition"
    t.integer "region_id"
    t.integer "period_type", limit: 1
    t.text "unassigned_user_ids"
    t.integer "posted_by_id"
    t.integer "declined_by_id"
    t.index ["approved_by_id"], name: "index_shift_requests_on_approved_by_id"
    t.index ["confirmed_by_id"], name: "index_shift_requests_on_confirmed_by_id"
    t.index ["created_by_id"], name: "index_shift_requests_on_created_by_id"
    t.index ["declined_by_id"], name: "index_shift_requests_on_declined_by_id"
    t.index ["destination_id"], name: "index_shift_requests_on_destination_id"
    t.index ["posted_by_id"], name: "index_shift_requests_on_posted_by_id"
    t.index ["region_id"], name: "index_shift_requests_on_region_id"
    t.index ["updated_by_id"], name: "index_shift_requests_on_updated_by_id"
    t.index ["user_id"], name: "index_shift_requests_on_user_id"
  end

  create_table "shift_reservations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "dated_on", null: false
    t.integer "user_id"
    t.integer "department_id"
    t.integer "count", default: 0, null: false
    t.string "description"
    t.integer "status", limit: 1, default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_reservations_on_created_by_id"
    t.index ["department_id"], name: "index_shift_reservations_on_department_id"
    t.index ["updated_by_id"], name: "index_shift_reservations_on_updated_by_id"
    t.index ["user_id"], name: "index_shift_reservations_on_user_id"
  end

  create_table "shift_sequence_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "shift_sequence_id"
    t.integer "shift_user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["shift_sequence_id"], name: "index_shift_sequence_users_on_shift_sequence_id"
    t.index ["shift_user_id"], name: "index_shift_sequence_users_on_shift_user_id"
  end

  create_table "shift_sequences", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.text "remark", size: :medium
    t.time "start_time"
    t.time "end_time"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "fk_rails_561648d4f1"
    t.index ["updated_by_id"], name: "fk_rails_9cb4d106f9"
  end

  create_table "shift_table_comment_dailies", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date", null: false
    t.text "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "shift_table_notices", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "read_on"
    t.boolean "hidden", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_shift_table_notices_on_user_id"
  end

  create_table "shift_time_cards", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "department_id", null: false
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.integer "rest_time"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "shift_user_id", null: false
    t.index ["department_id"], name: "index_shift_time_cards_on_department_id"
    t.index ["shift_user_id"], name: "index_shift_time_cards_on_shift_user_id"
  end

  create_table "shift_user_additions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_user_id", null: false
    t.integer "outside_type", limit: 1, default: 1, null: false
    t.boolean "unplanned", default: false, null: false
    t.integer "created_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_user_additions_on_created_by_id"
    t.index ["shift_user_id"], name: "index_shift_user_additions_on_shift_user_id"
  end

  create_table "shift_user_design_logs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift_user_design_id", null: false
    t.integer "before_roster_type", limit: 1, null: false
    t.integer "after_roster_type", limit: 1, null: false
    t.integer "confirmed_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["confirmed_by_id"], name: "index_shift_user_design_logs_on_confirmed_by_id"
    t.index ["shift_user_design_id"], name: "index_shift_user_design_logs_on_shift_user_design_id"
  end

  create_table "shift_user_designs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.integer "period_type", limit: 1, null: false
    t.integer "destination_id"
    t.integer "roster_type", limit: 1, null: false
    t.integer "frame_type", limit: 1, default: 1, null: false
    t.boolean "holiday", default: false, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "wday", limit: 1
    t.integer "status", limit: 1, default: 10
    t.index ["created_by_id"], name: "fk_rails_191d6ff8aa"
    t.index ["day", "user_id", "period_type", "status"], name: "shift_user_designs_index", unique: true
    t.index ["destination_id"], name: "index_shift_user_designs_on_destination_id"
    t.index ["updated_by_id"], name: "fk_rails_fdce4884e5"
    t.index ["user_id"], name: "index_shift_user_designs_on_user_id"
  end

  create_table "shift_user_holidays", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.integer "destination_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "user_id"], name: "index_shift_user_holidays_on_day_and_user_id", unique: true
    t.index ["destination_id"], name: "index_shift_user_holidays_on_destination_id"
    t.index ["user_id"], name: "index_shift_user_holidays_on_user_id"
  end

  create_table "shift_user_permissions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.integer "created_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_user_permissions_on_created_by_id"
    t.index ["day", "user_id"], name: "index_shift_user_permissions_on_day_and_user_id", unique: true
    t.index ["user_id"], name: "index_shift_user_permissions_on_user_id"
  end

  create_table "shift_user_shots", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id"
    t.integer "destination_id"
    t.integer "roster_type", limit: 1, null: false
    t.integer "period_type", limit: 1, null: false
    t.integer "frame_type", limit: 1, default: 1, null: false
    t.datetime "notified_at", precision: nil
    t.string "comment"
    t.index ["day", "user_id", "period_type"], name: "index_shift_user_shots_on_day_and_user_id_and_period_type", unique: true
    t.index ["destination_id"], name: "index_shift_user_shots_on_destination_id"
    t.index ["user_id"], name: "index_shift_user_shots_on_user_id"
  end

  create_table "shift_user_sups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.integer "sup_type", limit: 1, null: false
    t.integer "created_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "fk_rails_d55a225e72"
    t.index ["day", "user_id", "sup_type"], name: "index_shift_user_sups_on_day_and_user_id_and_sup_type", unique: true
    t.index ["user_id"], name: "index_shift_user_sups_on_user_id"
  end

  create_table "shift_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.integer "period_type", limit: 1, null: false
    t.integer "destination_id"
    t.integer "roster_type", limit: 1, null: false
    t.integer "frame_type", limit: 1, default: 1, null: false
    t.integer "status", limit: 1, default: 1
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "confirmed_by_id"
    t.integer "generated_from", limit: 1
    t.boolean "locked", default: false
    t.boolean "manager_check", default: false
    t.boolean "standby", default: false
    t.boolean "scramble", default: false
    t.boolean "border_crossing", default: false
    t.index ["confirmed_by_id"], name: "index_shift_users_on_confirmed_by_id"
    t.index ["created_by_id"], name: "fk_rails_17c68e4557"
    t.index ["day", "user_id", "period_type", "status"], name: "due_user_period_status", unique: true
    t.index ["destination_id"], name: "index_shift_users_on_destination_id"
    t.index ["updated_by_id"], name: "fk_rails_85bec1f076"
    t.index ["user_id"], name: "index_shift_users_on_user_id"
  end

  create_table "shift_weekly_checks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "wday", limit: 1, null: false
    t.integer "department_id", null: false
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_weekly_checks_on_created_by_id"
    t.index ["department_id"], name: "index_shift_weekly_checks_on_department_id"
    t.index ["updated_by_id"], name: "index_shift_weekly_checks_on_updated_by_id"
    t.index ["wday", "department_id"], name: "shift_weekly_checks_index"
  end

  create_table "shift_weekly_comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "dated_on", null: false
    t.integer "data_type", limit: 1, null: false
    t.integer "user_id", null: false
    t.string "comment"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_shift_weekly_comments_on_created_by_id"
    t.index ["dated_on", "data_type", "user_id"], name: "shift_weekly_comments_index", unique: true
    t.index ["updated_by_id"], name: "index_shift_weekly_comments_on_updated_by_id"
    t.index ["user_id"], name: "index_shift_weekly_comments_on_user_id"
  end

  create_table "shop_calendars", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.string "comment"
    t.integer "data_type", limit: 1, default: 1, null: false
    t.bigint "department_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "mon", default: false, null: false
    t.boolean "tue", default: false, null: false
    t.boolean "wed", default: false, null: false
    t.boolean "thu", default: false, null: false
    t.boolean "fri", default: false, null: false
    t.boolean "sat", default: false, null: false
    t.boolean "sun", default: false, null: false
    t.boolean "w1", default: true, null: false
    t.boolean "w2", default: true, null: false
    t.boolean "w3", default: true, null: false
    t.boolean "w4", default: true, null: false
    t.boolean "w5", default: true, null: false
    t.integer "repeat_type", limit: 1, default: 1, null: false
    t.date "start_date"
    t.date "finish_date"
    t.date "target_date"
    t.boolean "hidden", default: false, null: false
    t.integer "count_ph", limit: 1, default: 0, null: false
    t.integer "count_ow", limit: 1, default: 0, null: false
    t.index ["day", "department_id"], name: "index_shop_calendars_on_day_and_department_id", unique: true
    t.index ["department_id"], name: "index_shop_calendars_on_department_id"
  end

  create_table "shop_experiences", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "department_id", null: false
    t.integer "count", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "first_day"
    t.index ["department_id"], name: "index_shop_experiences_on_department_id"
    t.index ["user_id", "department_id"], name: "index_shop_experiences_on_user_id_and_department_id", unique: true
    t.index ["user_id"], name: "index_shop_experiences_on_user_id"
  end

  create_table "shop_hours", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "department_id"
    t.time "start_time"
    t.time "end_time"
    t.integer "rest_time"
    t.boolean "holiday", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "hour_type", limit: 1, null: false
    t.time "rest_start_time"
    t.time "rest_end_time"
    t.index ["day", "department_id", "hour_type", "holiday"], name: "day_dep_type_hol", unique: true
    t.index ["department_id"], name: "index_shop_hours_on_department_id"
  end

  create_table "shop_regular_times", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.date "day", null: false
    t.integer "regular_time", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id", "day"], name: "index_shop_regular_times_on_department_id_and_day", unique: true
    t.index ["department_id"], name: "index_shop_regular_times_on_department_id"
  end

  create_table "shop_report_staffs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "shop_report_id", null: false
    t.date "day", null: false
    t.integer "count_ph"
    t.integer "count_ow"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["shop_report_id", "day"], name: "shop_report_staffs_index", unique: true
    t.index ["shop_report_id"], name: "index_shop_report_staffs_on_shop_report_id"
  end

  create_table "shop_reports", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.date "regist_year_month", null: false
    t.text "sales_structure", size: :medium
    t.integer "sales_days_count_ph"
    t.integer "sales_days_count_ow"
    t.float "sales_average_ph"
    t.float "sales_average_ow"
    t.integer "sales_sum_ph"
    t.integer "sales_sum_ow"
    t.string "gc_sales", limit: 100
    t.string "gc_sales_year_ratio", limit: 100
    t.string "gc_sales_budget_ratio", limit: 100
    t.string "gc_technical", limit: 100
    t.string "gc_technical_year_ratio", limit: 100
    t.string "gc_technical_budget_ratio", limit: 100
    t.string "gc_medicine", limit: 100
    t.string "gc_medicine_year_ratio", limit: 100
    t.string "gc_medicine_budget_ratio", limit: 100
    t.string "gc_application", limit: 100
    t.string "gc_application_year_ratio", limit: 100
    t.string "gc_receipt", limit: 100
    t.string "gc_receipt_year_ratio", limit: 100
    t.string "gc_new_patients", limit: 100
    t.string "gc_new_patients_year_ratio", limit: 100
    t.string "gc_home_care", limit: 100
    t.string "gc_home_care_year_ratio", limit: 100
    t.text "gc_invisible_part", size: :medium
    t.string "ab_one_package", limit: 100
    t.string "ab_half_tablet", limit: 100
    t.string "ab_meter_mix_ointment", limit: 100
    t.string "ab_meter_mix_powder", limit: 100
    t.string "ab_meter_mix_liquid", limit: 100
    t.string "ab_unit_price", limit: 100
    t.boolean "ab_2d_barcode"
    t.boolean "ab_remote_prepared"
    t.boolean "ab_contact_from_clinic"
    t.text "ab_burden_of_structure", size: :medium
    t.text "lt_otc_sales_result", size: :medium
    t.text "lt_otc_sales_next_month", size: :medium
    t.text "lt_home_care_result", size: :medium
    t.string "lt_home_care_count", limit: 100
    t.string "lt_home_care_sales", limit: 100
    t.string "lt_home_care_medicine", limit: 100
    t.string "lt_home_care_dispensing", limit: 100
    t.text "lt_home_care_next_month", size: :medium
    t.string "lt_generic_profit", limit: 100
    t.text "lt_generic_result", size: :medium
    t.string "lt_generic_target_profit", limit: 100
    t.text "lt_generic_next_month", size: :medium
    t.text "lt_generic_negotiation", size: :medium
    t.boolean "lt_destination_check"
    t.text "competitors_info", size: :medium
    t.text "store_opening_info", size: :medium
    t.text "sales_development_info", size: :medium
    t.string "sd_prescription_count", limit: 100
    t.string "sd_current_number_of_staff", limit: 100
    t.string "sd_holiday_remain", limit: 100
    t.string "sd_number_of_workday", limit: 100
    t.string "sd_target_number_of_staff", limit: 100
    t.string "sd_ref_workday_count", limit: 100
    t.string "sd_ref_workday_remain", limit: 100
    t.string "sd_ref_workday_total", limit: 100
    t.string "sd_ref_holiday_remain", limit: 100
    t.string "sd_ref_prescription_count", limit: 100
    t.string "sd_ref_prescription_expect", limit: 100
    t.string "sd_ref_prescription_average", limit: 100
    t.string "sd_ref_prescription_avg_expect", limit: 100
    t.text "application_for_registration", size: :medium
    t.boolean "temporary_registered"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["department_id"], name: "index_shop_reports_on_department_id"
  end

  create_table "shops", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id"
    t.string "code"
    t.string "name"
    t.string "kana"
    t.string "shop_name"
    t.string "shop_name_kana"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "hidden", default: false
    t.integer "data_type", default: 1
    t.index ["company_id", "code"], name: "index_shops_on_company_id_and_code", unique: true
    t.index ["company_id"], name: "index_shops_on_company_id"
  end

  create_table "staff_agencies", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.string "tel"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_staff_agencies_on_created_by_id"
    t.index ["updated_by_id"], name: "index_staff_agencies_on_updated_by_id"
  end

  create_table "staff_discount_types", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_staff_discount_types_on_code", unique: true
  end

  create_table "staff_discounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "month", null: false
    t.integer "staff_discount_type_id", null: false
    t.integer "user_id", null: false
    t.integer "amount", default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_staff_discounts_on_created_by_id"
    t.index ["month", "staff_discount_type_id", "user_id"], name: "staff_discounts_index", unique: true
    t.index ["staff_discount_type_id"], name: "index_staff_discounts_on_staff_discount_type_id"
    t.index ["updated_by_id"], name: "index_staff_discounts_on_updated_by_id"
    t.index ["user_id"], name: "index_staff_discounts_on_user_id"
  end

  create_table "staff_summaries", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day", null: false
    t.integer "job_type", limit: 1, null: false
    t.float "count_user", default: 0.0, null: false
    t.float "count_shop", default: 0.0, null: false
    t.float "count_pxk", default: 0.0, null: false
    t.float "count_f", default: 0.0, null: false
    t.float "haken", default: 0.0, null: false
    t.float "paid_holiday", default: 0.0, null: false
    t.float "exective_holiday", default: 0.0, null: false
    t.float "changed_to_holiday", default: 0.0, null: false
    t.float "move_to", default: 0.0, null: false
    t.float "shop_business", default: 0.0, null: false
    t.float "frame_plus", default: 0.0, null: false
    t.float "over_frame", default: 0.0, null: false
    t.float "outside", default: 0.0, null: false
    t.float "unplanned_holiday", default: 0.0, null: false
    t.float "changed_to_work", default: 0.0, null: false
    t.float "move_from", default: 0.0, null: false
    t.float "shop_closed", default: 0.0, null: false
    t.float "frame_minus", default: 0.0, null: false
    t.float "count_nkk", default: 0.0, null: false
    t.float "filler", default: 0.0, null: false
    t.float "purchase", default: 0.0, null: false
    t.float "weekly_holiday", default: 0.0, null: false
    t.text "user_ids", size: :medium
    t.text "destination_ids", size: :medium
    t.text "frame_count", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.float "count_c", default: 0.0, null: false
    t.integer "area_id"
    t.float "reserve_capacity", default: 0.0, null: false
    t.text "area_changes", size: :medium
    t.float "parttime_job", default: 0.0, null: false
    t.float "outside_b", default: 0.0, null: false
    t.integer "mode", limit: 1, default: 1, null: false
    t.integer "count_h", default: 0, null: false
    t.index ["area_id"], name: "index_staff_summaries_on_area_id"
    t.index ["day", "area_id", "job_type", "mode"], name: "staff_summaries_day_area_job_type_mode", unique: true
  end

  create_table "stock_holders", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_id", null: false
    t.date "dated_on", null: false
    t.integer "number"
    t.float "ratio"
    t.integer "alter_type", limit: 1, default: 1, null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "holder_user_id"
    t.integer "holder_company_id"
    t.index ["company_id"], name: "index_stock_holders_on_company_id"
    t.index ["dated_on", "company_id", "holder_company_id"], name: "idx_date_company_holder_company", unique: true
    t.index ["dated_on", "company_id", "holder_user_id"], name: "idx_date_company_holder_user", unique: true
    t.index ["holder_company_id"], name: "index_stock_holders_on_holder_company_id"
    t.index ["holder_user_id"], name: "index_stock_holders_on_holder_user_id"
    t.index ["updated_by_id"], name: "index_stock_holders_on_updated_by_id"
  end

  create_table "strategic_human_resources", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.text "share_content"
    t.datetime "contact_date", precision: nil
    t.integer "contact_user_id"
    t.boolean "hidden", default: false, null: false
    t.integer "status", limit: 1, default: 1, null: false
    t.integer "created_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["contact_user_id"], name: "index_strategic_human_resources_on_contact_user_id"
    t.index ["created_by_id"], name: "index_strategic_human_resources_on_created_by_id"
    t.index ["user_id"], name: "index_strategic_human_resources_on_user_id"
  end

  create_table "substitute_work_days", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "change_shift_user_id", null: false
    t.integer "substitute_shift_user_id"
    t.integer "created_by_id"
    t.datetime "checked_at", precision: nil
    t.integer "checker_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["change_shift_user_id", "substitute_shift_user_id"], name: "substitute_work_days_index", unique: true
    t.index ["checker_id"], name: "fk_rails_3a74abf921"
    t.index ["created_by_id"], name: "fk_rails_a8604bf308"
    t.index ["substitute_shift_user_id"], name: "fk_rails_29ee8ee67d"
  end

  create_table "supervisor_infos", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "user_id", null: false
    t.date "day", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "status", limit: 1, default: 1
    t.string "comment"
    t.string "arrangement"
    t.date "final_date"
    t.integer "manager_id"
    t.date "manager_input_date"
    t.integer "created_by_id"
    t.index ["created_by_id"], name: "index_supervisor_infos_on_created_by_id"
    t.index ["department_id", "day", "status"], name: "index_supervisor_infos_on_department_id_and_day_and_status", unique: true
    t.index ["department_id"], name: "index_supervisor_infos_on_department_id"
    t.index ["manager_id"], name: "index_supervisor_infos_on_manager_id"
    t.index ["user_id"], name: "index_supervisor_infos_on_user_id"
  end

  create_table "suppliers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "original_tag"
    t.string "search_tag"
    t.boolean "hidden", default: false, null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_suppliers_on_created_by_id"
    t.index ["name"], name: "index_suppliers_on_name", unique: true
    t.index ["updated_by_id"], name: "index_suppliers_on_updated_by_id"
  end

  create_table "task_categories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", null: false
    t.integer "parent_id"
    t.string "name", null: false
    t.string "display_name", null: false
    t.string "color"
    t.string "description"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code", "parent_id"], name: "index_task_categories_on_code_and_parent_id", unique: true
    t.index ["created_by_id"], name: "index_task_categories_on_created_by_id"
    t.index ["parent_id"], name: "index_task_categories_on_parent_id"
    t.index ["updated_by_id"], name: "index_task_categories_on_updated_by_id"
  end

  create_table "task_category_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "task_category_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["task_category_id", "user_id"], name: "index_task_category_users_on_task_category_id_and_user_id", unique: true
    t.index ["task_category_id"], name: "index_task_category_users_on_task_category_id"
    t.index ["user_id"], name: "index_task_category_users_on_user_id"
  end

  create_table "task_meetings", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "title", null: false
    t.string "purpose"
    t.integer "cycle_type", limit: 1
    t.date "limit_date"
    t.boolean "urgent"
    t.string "method"
    t.integer "status", limit: 1
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "category_code"
    t.integer "interval_type", limit: 1
    t.boolean "sun", default: false, null: false
    t.boolean "mon", default: false, null: false
    t.boolean "tue", default: false, null: false
    t.boolean "wed", default: false, null: false
    t.boolean "thu", default: false, null: false
    t.boolean "fri", default: false, null: false
    t.boolean "sat", default: false, null: false
    t.boolean "w1", default: false, null: false
    t.boolean "w2", default: false, null: false
    t.boolean "w3", default: false, null: false
    t.boolean "w4", default: false, null: false
    t.boolean "w5", default: false, null: false
    t.date "start_on"
    t.date "end_on"
    t.index ["created_by_id"], name: "index_task_meetings_on_created_by_id"
    t.index ["updated_by_id"], name: "index_task_meetings_on_updated_by_id"
  end

  create_table "task_report_additions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "task_report_id", null: false
    t.text "purpose", size: :medium
    t.text "content", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["task_report_id"], name: "index_task_report_additions_on_task_report_id"
  end

  create_table "task_report_timelines", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "task_report_id", null: false
    t.time "start_at", null: false
    t.integer "duration"
    t.text "content", size: :medium
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["task_report_id", "start_at"], name: "index_task_report_timelines_on_task_report_id_and_start_at", unique: true
    t.index ["task_report_id"], name: "index_task_report_timelines_on_task_report_id"
  end

  create_table "task_reports", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "dated_on", null: false
    t.integer "user_id", null: false
    t.text "content", size: :medium
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "absent", default: false, null: false
    t.integer "kkb_id"
    t.text "purpose", size: :medium
    t.text "special_notes", size: :medium
    t.index ["created_by_id"], name: "index_task_reports_on_created_by_id"
    t.index ["dated_on", "user_id"], name: "index_task_reports_on_dated_on_and_user_id", unique: true
    t.index ["kkb_id"], name: "index_task_reports_on_kkb_id"
    t.index ["updated_by_id"], name: "index_task_reports_on_updated_by_id"
    t.index ["user_id"], name: "index_task_reports_on_user_id"
  end

  create_table "task_target_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "display_name", null: false
    t.string "color"
    t.integer "rank", default: 1, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "started_on"
    t.date "ended_on"
    t.index ["created_by_id"], name: "index_task_target_users_on_created_by_id"
    t.index ["updated_by_id"], name: "index_task_target_users_on_updated_by_id"
    t.index ["user_id"], name: "index_task_target_users_on_user_id", unique: true
  end

  create_table "task_users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["task_id", "user_id"], name: "index_task_users_on_task_id_and_user_id", unique: true
    t.index ["task_id"], name: "index_task_users_on_task_id"
    t.index ["user_id"], name: "index_task_users_on_user_id"
  end

  create_table "tasks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "task_category_id", null: false
    t.date "dated_on"
    t.time "start_at"
    t.integer "duration"
    t.integer "user_count"
    t.string "description"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "task_meeting_id"
    t.integer "status", limit: 1, default: 0, null: false
    t.string "place"
    t.index ["created_by_id"], name: "index_tasks_on_created_by_id"
    t.index ["task_category_id"], name: "index_tasks_on_task_category_id"
    t.index ["task_meeting_id"], name: "index_tasks_on_task_meeting_id"
    t.index ["updated_by_id"], name: "index_tasks_on_updated_by_id"
  end

  create_table "team_tags", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name"], name: "index_team_tags_on_name", unique: true
  end

  create_table "technical_fee_rates", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "clinical_dept", limit: 1, null: false
    t.float "rate", default: 0.0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["clinical_dept"], name: "index_technical_fee_rates_on_clinical_dept", unique: true
  end

  create_table "time_card_generators", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "user_id", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.integer "rest_time"
    t.boolean "enable_sun", default: true, null: false
    t.boolean "enable_mon", default: true, null: false
    t.boolean "enable_tue", default: true, null: false
    t.boolean "enable_wed", default: true, null: false
    t.boolean "enable_thu", default: true, null: false
    t.boolean "enable_fri", default: true, null: false
    t.boolean "enable_sat", default: true, null: false
    t.boolean "enable_hol", default: true, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_time_card_generators_on_created_by_id"
    t.index ["department_id"], name: "index_time_card_generators_on_department_id"
    t.index ["updated_by_id"], name: "index_time_card_generators_on_updated_by_id"
    t.index ["user_id"], name: "index_time_card_generators_on_user_id"
  end

  create_table "time_cards", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "time_record_id", null: false
    t.integer "department_id"
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.integer "rest_time"
    t.datetime "real_start_time", precision: nil
    t.string "start_ip"
    t.string "end_ip"
    t.index ["department_id"], name: "index_time_cards_on_department_id"
    t.index ["time_record_id"], name: "index_time_cards_on_time_record_id"
  end

  create_table "time_record_results", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "time_record_id", null: false
    t.integer "work_time", null: false
    t.integer "over_time", null: false
    t.integer "night_over_time", null: false
    t.integer "night_work", null: false
    t.integer "calc_type", limit: 1, default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["time_record_id"], name: "index_time_record_results_on_time_record_id", unique: true
  end

  create_table "time_record_summaries", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "dated_on", null: false
    t.integer "user_id", null: false
    t.integer "work_time", default: 0, null: false
    t.integer "rest_time", default: 0, null: false
    t.integer "over_time", default: 0, null: false
    t.integer "night_over_time", default: 0, null: false
    t.string "department_ids"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type", limit: 1, default: 1, null: false
    t.index ["dated_on", "user_id", "data_type"], name: "time_record_summaries_index", unique: true
    t.index ["user_id"], name: "index_time_record_summaries_on_user_id"
  end

  create_table "time_records", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "data_type", limit: 1, default: 1, null: false
    t.integer "holiday_type", limit: 1, default: 0, null: false
    t.integer "move_type", limit: 1, default: 0, null: false
    t.boolean "diff_roster_type", default: false, null: false
    t.boolean "diff_department", default: false, null: false
    t.integer "edit_user_id"
    t.string "comment"
    t.datetime "real_start_time", precision: nil
    t.datetime "shop_start_time", precision: nil
    t.index ["day", "user_id", "data_type"], name: "index_time_records_on_day_and_user_id_and_data_type", unique: true
    t.index ["edit_user_id"], name: "fk_rails_1669de8bc3"
    t.index ["user_id"], name: "index_time_records_on_user_id"
  end

  create_table "time_sheets", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "day"
    t.integer "user_id"
    t.integer "data_type", limit: 1, default: 1, null: false
    t.integer "edit_user_id"
    t.datetime "start_time1", precision: nil
    t.datetime "end_time1", precision: nil
    t.integer "rest_time1"
    t.integer "department1_id"
    t.datetime "start_time2", precision: nil
    t.datetime "end_time2", precision: nil
    t.integer "rest_time2"
    t.integer "department2_id"
    t.datetime "start_time3", precision: nil
    t.datetime "end_time3", precision: nil
    t.integer "rest_time3"
    t.integer "department3_id"
    t.datetime "start_time4", precision: nil
    t.datetime "end_time4", precision: nil
    t.integer "rest_time4"
    t.integer "department4_id"
    t.datetime "start_time5", precision: nil
    t.datetime "end_time5", precision: nil
    t.integer "rest_time5"
    t.integer "department5_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "holiday_type", limit: 1, default: 0, null: false
    t.integer "move_type", limit: 1, default: 0, null: false
    t.boolean "diff_roster_type", default: false, null: false
    t.boolean "diff_department", default: false, null: false
    t.index ["day", "user_id", "data_type"], name: "index_time_sheets_on_day_and_user_id_and_data_type", unique: true
    t.index ["department1_id"], name: "index_time_sheets_on_department1_id"
    t.index ["department2_id"], name: "index_time_sheets_on_department2_id"
    t.index ["department3_id"], name: "index_time_sheets_on_department3_id"
    t.index ["department4_id"], name: "index_time_sheets_on_department4_id"
    t.index ["department5_id"], name: "index_time_sheets_on_department5_id"
    t.index ["edit_user_id"], name: "index_time_sheets_on_edit_user_id"
    t.index ["user_id"], name: "index_time_sheets_on_user_id"
  end

  create_table "trn_capture_histories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "capture_category_id", null: false
    t.date "accrual_month"
    t.date "payment_month"
    t.boolean "lock_flg", default: false, null: false
    t.integer "created_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["capture_category_id"], name: "index_trn_capture_histories_on_capture_category_id"
    t.index ["created_by_id"], name: "index_trn_capture_histories_on_created_by_id"
  end

  create_table "trn_capture_records", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "capture_history_id", null: false
    t.integer "row_no", null: false
    t.string "company_code", null: false
    t.string "department_code", null: false
    t.string "business_connection_code"
    t.integer "account_code"
    t.integer "account_sub_code"
    t.integer "amount", null: false
    t.integer "second_amount", null: false
    t.string "list_cd"
    t.integer "tax_class_code", limit: 1
    t.integer "tax_rate_code", limit: 1
    t.integer "created_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["capture_history_id"], name: "index_trn_capture_records_on_capture_history_id"
    t.index ["created_by_id"], name: "index_trn_capture_records_on_created_by_id"
  end

  create_table "trn_journal_entry_histories", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "capture_history_id", null: false
    t.integer "capture_category_id", null: false
    t.date "accrual_month"
    t.date "payment_month", null: false
    t.boolean "execute_flag", default: false, null: false
    t.integer "created_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["capture_category_id"], name: "index_trn_journal_entry_histories_on_capture_category_id"
    t.index ["capture_history_id"], name: "index_trn_journal_entry_histories_on_capture_history_id"
    t.index ["created_by_id"], name: "index_trn_journal_entry_histories_on_created_by_id"
  end

  create_table "trn_journal_entry_records", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "journal_entry_history_id", null: false
    t.integer "excel_row_no", null: false
    t.integer "row_no", null: false
    t.date "date", null: false
    t.string "company_code", null: false
    t.string "department_code"
    t.string "debit_department_code"
    t.integer "debit_account_code"
    t.integer "debit_account_sub_code"
    t.integer "debit_amount"
    t.string "debit_business_connection_code"
    t.string "credit_department_code"
    t.integer "credit_account_code"
    t.integer "credit_account_sub_code"
    t.integer "credit_amount"
    t.string "credit_business_connection_code"
    t.string "abstract"
    t.integer "debit_tax_class_code", limit: 1
    t.integer "credit_tax_class_code", limit: 1
    t.integer "debit_tax_rate_code", limit: 1
    t.integer "credit_tax_rate_code", limit: 1
    t.integer "created_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_trn_journal_entry_records_on_created_by_id"
    t.index ["credit_department_code"], name: "index_trn_journal_entry_records_on_credit_department_code"
    t.index ["debit_department_code"], name: "index_trn_journal_entry_records_on_debit_department_code"
    t.index ["department_code"], name: "index_trn_journal_entry_records_on_department_code"
    t.index ["journal_entry_history_id"], name: "index_trn_journal_entry_records_on_journal_entry_history_id"
  end

  create_table "uniform_numbers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "class_lg", null: false
    t.string "class_md"
    t.string "class_sm"
    t.string "description"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "started_on"
    t.index ["class_lg", "class_md", "class_sm"], name: "uniform_numbers_index", unique: true
    t.index ["created_by_id"], name: "index_uniform_numbers_on_created_by_id"
    t.index ["updated_by_id"], name: "index_uniform_numbers_on_updated_by_id"
  end

  create_table "unit_daily_reports", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "unit_report_item_id", null: false
    t.string "content"
    t.integer "status", limit: 1, default: 0, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "kkb_id"
    t.index ["created_by_id"], name: "index_unit_daily_reports_on_created_by_id"
    t.index ["day", "unit_report_item_id"], name: "index_unit_daily_reports_on_day_and_unit_report_item_id"
    t.index ["kkb_id"], name: "index_unit_daily_reports_on_kkb_id"
    t.index ["unit_report_item_id"], name: "index_unit_daily_reports_on_unit_report_item_id"
    t.index ["updated_by_id"], name: "index_unit_daily_reports_on_updated_by_id"
  end

  create_table "unit_report_items", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "organization_unit_id", null: false
    t.string "name", null: false
    t.string "example"
    t.date "start_on"
    t.date "end_on"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_unit_report_items_on_created_by_id"
    t.index ["organization_unit_id"], name: "index_unit_report_items_on_organization_unit_id"
    t.index ["updated_by_id"], name: "index_unit_report_items_on_updated_by_id"
  end

  create_table "unit_tasks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "occurrence_date", null: false
    t.string "task_name", null: false
    t.text "content"
    t.integer "to_organization_unit_id"
    t.integer "from_organization_unit_id"
    t.date "due_date"
    t.text "notes"
    t.integer "status", limit: 1, default: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "code"
    t.date "start_date"
    t.date "end_date"
    t.text "official_document"
    t.integer "kkb_board_number"
    t.text "progress"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "index_unit_tasks_on_created_by_id"
    t.index ["from_organization_unit_id"], name: "index_unit_tasks_on_from_organization_unit_id"
    t.index ["to_organization_unit_id"], name: "index_unit_tasks_on_to_organization_unit_id"
    t.index ["updated_by_id"], name: "index_unit_tasks_on_updated_by_id"
  end

  create_table "unknown_bank_branches", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "bank_code", null: false
    t.string "bank_name", null: false
    t.string "branch_code", null: false
    t.string "branch_name", null: false
    t.string "branch_kana", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["bank_code", "branch_code"], name: "index_unknown_bank_branches_on_bank_code_and_branch_code", unique: true
  end

  create_table "user_additions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "movie_url"
    t.string "note1"
    t.string "note2"
    t.integer "pay_statement_type"
    t.integer "bonus_statement_type"
    t.time "basis_break_time"
    t.integer "group_leader_id"
    t.string "education_history", limit: 50
    t.integer "education_history_year"
    t.string "graduate_school", limit: 50
    t.integer "graduate_school_year"
    t.integer "emergency_contact_relation", limit: 2
    t.string "emergency_contact_number", limit: 50
    t.integer "tax_exemption_table", limit: 1
    t.integer "dependent_widow", limit: 1
    t.integer "handicapped", limit: 1
    t.string "nearest_station"
    t.string "route_to_nearest_station"
    t.string "address_post_code", limit: 10
    t.string "address_prefecture", limit: 10
    t.string "address_municipality", limit: 20
    t.string "address_house_number", limit: 50
    t.string "address_etc", limit: 50
    t.string "address_kana", limit: 100
    t.string "resident_post_code", limit: 10
    t.string "resident_prefecture", limit: 10
    t.string "resident_municipality", limit: 20
    t.string "resident_house_number", limit: 50
    t.string "resident_etc", limit: 50
    t.string "resident_kana", limit: 100
    t.string "retired_post_code", limit: 10
    t.string "retired_prefecture", limit: 10
    t.string "retired_municipality", limit: 20
    t.string "retired_house_number", limit: 50
    t.string "retired_etc", limit: 50
    t.string "retired_kana", limit: 100
    t.string "spouse_name", limit: 50
    t.string "spouse_name_last", limit: 25
    t.string "spouse_name_first", limit: 25
    t.string "spouse_kana", limit: 100
    t.string "spouse_kana_last", limit: 50
    t.string "spouse_kana_first", limit: 50
    t.integer "spouse_sex", limit: 1
    t.date "spouse_birthday"
    t.integer "spouse_living_status", limit: 1
    t.integer "spouse_handicapped", limit: 1
    t.integer "spouse_health_insurance", limit: 1
    t.integer "spouse_dependent_type", limit: 1
    t.boolean "commutable_by_car"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "married"
    t.boolean "has_dependents"
    t.date "birthday"
    t.integer "sex", limit: 1
    t.text "strategy", size: :medium
    t.string "resident_tel", limit: 50
    t.string "retired_tel", limit: 50
    t.boolean "pharmacist_license", default: false, null: false
    t.string "pharmacist_number", limit: 50
    t.date "pharmacist_registered_date"
    t.string "ins_pharmacist_prefecture", limit: 10
    t.string "ins_pharmacist_number", limit: 50
    t.date "ins_pharmacist_registered_date"
    t.integer "my_cars", limit: 1
    t.string "retired_email"
    t.integer "spouse_nursing_care", limit: 1
    t.boolean "registered_seller", default: false, null: false
    t.date "registered_seller_date"
    t.string "registered_seller_number1", limit: 2
    t.string "registered_seller_number2", limit: 2
    t.string "registered_seller_number3", limit: 5
    t.string "other_post_code", limit: 10
    t.string "other_prefecture", limit: 10
    t.string "other_municipality", limit: 20
    t.string "other_house_number", limit: 50
    t.string "other_etc", limit: 50
    t.string "other_kana", limit: 100
    t.string "other_tel", limit: 50
    t.index ["group_leader_id"], name: "index_user_additions_on_group_leader_id"
    t.index ["user_id"], name: "index_user_additions_on_user_id"
  end

  create_table "user_areas_regions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "area_id", null: false
    t.integer "region_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["area_id", "region_id"], name: "index_user_areas_regions_on_area_id_and_region_id", unique: true
    t.index ["area_id"], name: "index_user_areas_regions_on_area_id"
    t.index ["region_id"], name: "index_user_areas_regions_on_region_id"
  end

  create_table "user_block_values", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.integer "block_value_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["block_value_id"], name: "index_user_block_values_on_block_value_id"
    t.index ["day", "user_id"], name: "index_user_block_values_on_day_and_user_id", unique: true
    t.index ["user_id"], name: "index_user_block_values_on_user_id"
  end

  create_table "user_certified_licenses", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "number"
    t.integer "update_times"
    t.date "start_day"
    t.date "finish_day"
    t.index ["user_id"], name: "index_user_certified_licenses_on_user_id"
  end

  create_table "user_code_generators", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "company_section", limit: 1, null: false
    t.integer "company_id"
    t.integer "employment", limit: 1
    t.string "prefix_char"
    t.integer "start_number"
    t.integer "end_number"
    t.integer "current_number"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["company_id"], name: "index_user_code_generators_on_company_id"
    t.index ["updated_by_id"], name: "index_user_code_generators_on_updated_by_id"
  end

  create_table "user_divisions", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.integer "division_type", limit: 1, default: 1, null: false
    t.boolean "hidden", default: false, null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_user_divisions_on_code", unique: true
    t.index ["created_by_id"], name: "index_user_divisions_on_created_by_id"
    t.index ["updated_by_id"], name: "index_user_divisions_on_updated_by_id"
  end

  create_table "user_families", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", limit: 50
    t.string "name_last", limit: 25
    t.string "name_first", limit: 25
    t.string "kana", limit: 100
    t.string "kana_last", limit: 50
    t.string "kana_first", limit: 50
    t.integer "sex", limit: 1
    t.integer "relation", limit: 2
    t.date "birthday"
    t.integer "living_status", limit: 1
    t.integer "handicapped", limit: 1
    t.integer "health_insurance", limit: 1
    t.integer "dependent_type", limit: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "nursing_care", limit: 1
    t.index ["user_id"], name: "index_user_families_on_user_id"
  end

  create_table "user_notifications", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "column_name"
    t.string "comment"
    t.integer "created_by_id", null: false
    t.datetime "notified_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["created_by_id"], name: "index_user_notifications_on_created_by_id"
    t.index ["user_id"], name: "index_user_notifications_on_user_id"
  end

  create_table "user_regular_times", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.integer "regular_time"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id", "day"], name: "index_user_regular_times_on_user_id_and_day", unique: true
    t.index ["user_id"], name: "index_user_regular_times_on_user_id"
  end

  create_table "user_relationships", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "related_id", null: false
    t.integer "relation_type", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["related_id"], name: "index_user_relationships_on_related_id"
    t.index ["user_id"], name: "index_user_relationships_on_user_id"
  end

  create_table "user_roles", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.boolean "hidden", default: false, null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_user_roles_on_code", unique: true
    t.index ["created_by_id"], name: "index_user_roles_on_created_by_id"
    t.index ["updated_by_id"], name: "index_user_roles_on_updated_by_id"
  end

  create_table "user_roster_infos", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.integer "department_id"
    t.integer "area_id"
    t.integer "job_type", limit: 1
    t.integer "table_type", limit: 1
    t.integer "employment", limit: 1
    t.boolean "hidden", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "over_time", limit: 1
    t.integer "paid_holiday_work_time_sun"
    t.integer "paid_holiday_work_time_mon"
    t.integer "paid_holiday_work_time_tue"
    t.integer "paid_holiday_work_time_wed"
    t.integer "paid_holiday_work_time_thu"
    t.integer "paid_holiday_work_time_fri"
    t.integer "paid_holiday_work_time_sat"
    t.boolean "hidden_shift", default: false, null: false
    t.boolean "double_shift", default: false, null: false
    t.boolean "show_unassigned_shift", default: false, null: false
    t.integer "company_id"
    t.integer "course_type", limit: 1
    t.integer "fixed_rest_time_sun", limit: 2
    t.integer "fixed_rest_time_mon", limit: 2
    t.integer "fixed_rest_time_tue", limit: 2
    t.integer "fixed_rest_time_wed", limit: 2
    t.integer "fixed_rest_time_thu", limit: 2
    t.integer "fixed_rest_time_fri", limit: 2
    t.integer "fixed_rest_time_sat", limit: 2
    t.integer "ads_mediator_id"
    t.integer "shift_manager_id"
    t.integer "former_company_id"
    t.integer "group_leader_id"
    t.integer "over_time_app", limit: 1
    t.integer "over_time_checker_id"
    t.integer "salary_category_id"
    t.integer "manager_id"
    t.integer "deployment_id"
    t.integer "user_segment_id"
    t.integer "user_role_id"
    t.integer "user_division_id"
    t.boolean "hidden_s2", default: false, null: false
    t.integer "salary_type_id"
    t.integer "organization_unit_id"
    t.index ["ads_mediator_id"], name: "index_user_roster_infos_on_ads_mediator_id"
    t.index ["area_id"], name: "index_user_roster_infos_on_area_id"
    t.index ["company_id"], name: "index_user_roster_infos_on_company_id"
    t.index ["department_id"], name: "index_user_roster_infos_on_department_id"
    t.index ["deployment_id"], name: "index_user_roster_infos_on_deployment_id"
    t.index ["former_company_id"], name: "index_user_roster_infos_on_former_company_id"
    t.index ["group_leader_id"], name: "index_user_roster_infos_on_group_leader_id"
    t.index ["manager_id"], name: "index_user_roster_infos_on_manager_id"
    t.index ["organization_unit_id"], name: "index_user_roster_infos_on_organization_unit_id"
    t.index ["over_time_checker_id"], name: "index_user_roster_infos_on_over_time_checker_id"
    t.index ["salary_category_id"], name: "index_user_roster_infos_on_salary_category_id"
    t.index ["salary_type_id"], name: "index_user_roster_infos_on_salary_type_id"
    t.index ["shift_manager_id"], name: "index_user_roster_infos_on_shift_manager_id"
    t.index ["user_division_id"], name: "index_user_roster_infos_on_user_division_id"
    t.index ["user_id", "day"], name: "index_user_roster_infos_on_user_id_and_day", unique: true
    t.index ["user_id"], name: "index_user_roster_infos_on_user_id"
    t.index ["user_role_id"], name: "index_user_roster_infos_on_user_role_id"
    t.index ["user_segment_id"], name: "index_user_roster_infos_on_user_segment_id"
  end

  create_table "user_segments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.boolean "hidden", default: false, null: false
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["code"], name: "index_user_segments_on_code", unique: true
    t.index ["created_by_id"], name: "index_user_segments_on_created_by_id"
    t.index ["updated_by_id"], name: "index_user_segments_on_updated_by_id"
  end

  create_table "user_shift_blocks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "day", null: false
    t.integer "user_id", null: false
    t.integer "shift_block_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["day", "user_id"], name: "index_user_shift_blocks_on_day_and_user_id"
    t.index ["shift_block_id"], name: "index_user_shift_blocks_on_shift_block_id"
    t.index ["user_id"], name: "index_user_shift_blocks_on_user_id"
  end

  create_table "user_start_times", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "wday", limit: 1, null: false
    t.time "start_time", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id", "wday"], name: "index_user_start_times_on_user_id_and_wday", unique: true
    t.index ["user_id"], name: "index_user_start_times_on_user_id"
  end

  create_table "user_team_tags", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "team_tag_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["team_tag_id"], name: "index_user_team_tags_on_team_tag_id"
    t.index ["user_id", "team_tag_id"], name: "index_user_team_tags_on_user_id_and_team_tag_id", unique: true
    t.index ["user_id"], name: "index_user_team_tags_on_user_id"
  end

  create_table "user_uniform_numbers", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "uniform_number_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "dated_on", null: false
    t.index ["uniform_number_id"], name: "index_user_uniform_numbers_on_uniform_number_id"
    t.index ["user_id", "uniform_number_id", "dated_on"], name: "user_uniform_numbers_index", unique: true
    t.index ["user_id"], name: "index_user_uniform_numbers_on_user_id"
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code"
    t.boolean "sekisyo", default: false
    t.boolean "shift_auth", default: false
    t.boolean "mail_target", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "tel"
    t.date "entry_date"
    t.date "retire_date"
    t.date "final_date"
    t.boolean "enable_misc_exp", default: false
    t.boolean "enable_commuting", default: true
    t.integer "user_type", default: 1
    t.string "name1"
    t.string "name2"
    t.string "kana1"
    t.string "kana2"
    t.integer "sex", limit: 1
    t.date "start_date"
    t.integer "legal_holiday_count", default: 0
    t.integer "paid_holiday_count", default: 0
    t.string "shift_number1"
    t.string "shift_number2"
    t.boolean "hidden", default: false
    t.date "start_day_count"
    t.date "finish_day_count"
    t.boolean "countable_roster", default: false
    t.boolean "selectable_assign_shop", default: false
    t.boolean "editable_legal_holiday", default: false, null: false
    t.integer "section", limit: 1, default: 1, null: false
    t.boolean "restrict_openness", default: false, null: false
    t.boolean "nkk_sun", default: false, null: false
    t.boolean "nkk_mon", default: false, null: false
    t.boolean "nkk_tue", default: false, null: false
    t.boolean "nkk_wed", default: false, null: false
    t.boolean "nkk_thu", default: false, null: false
    t.boolean "nkk_fri", default: false, null: false
    t.boolean "nkk_sat", default: false, null: false
    t.integer "expense_section", limit: 1, default: 1, null: false
    t.boolean "enable_time_record", default: true, null: false
    t.boolean "enable_final_paid_holiday", default: false, null: false
    t.integer "location_address_id"
    t.integer "location_station_id"
    t.boolean "always_remember_me", default: false, null: false
    t.string "route_to_nearest_station"
    t.string "address_post_code", limit: 10
    t.string "address_prefecture", limit: 10
    t.string "address_municipality", limit: 20
    t.string "address_house_number", limit: 50
    t.string "address_etc", limit: 50
    t.string "address_kana"
    t.date "birthday"
    t.integer "commutable_by_car", limit: 1
    t.boolean "commutable_by_train"
    t.string "former_name"
    t.string "former_kana"
    t.string "address_tel", limit: 50
    t.boolean "enable_notify_shift", default: true, null: false
    t.integer "parent_id"
    t.integer "session_timeout", null: false
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at", precision: nil
    t.boolean "reconfirmation", default: false, null: false
    t.boolean "set_rest_time_sun", default: false, null: false
    t.boolean "set_rest_time_mon", default: false, null: false
    t.boolean "set_rest_time_tue", default: false, null: false
    t.boolean "set_rest_time_wed", default: false, null: false
    t.boolean "set_rest_time_thu", default: false, null: false
    t.boolean "set_rest_time_fri", default: false, null: false
    t.boolean "set_rest_time_sat", default: false, null: false
    t.integer "job_desc", limit: 1
    t.integer "manager_days_count"
    t.date "manager_days_start"
    t.date "manager_days_end"
    t.date "entry_date_before"
    t.string "mobile"
    t.boolean "enable_salary", default: true
    t.integer "pay_revision_month", limit: 1
    t.integer "entry_type", limit: 1, default: 0, null: false
    t.integer "evaluation_month", limit: 1
    t.string "affiliation"
    t.integer "manager_days_reference_year"
    t.integer "manager_days_reference_parent_number"
    t.integer "manager_days_reference_number"
    t.integer "ranking", default: 0, null: false
    t.boolean "sync_with_contract_time", default: true, null: false
    t.string "provider", default: "code", null: false
    t.string "uid", default: "", null: false
    t.text "tokens"
    t.index ["code"], name: "index_users_on_code", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location_address_id"], name: "index_users_on_location_address_id"
    t.index ["location_station_id"], name: "index_users_on_location_station_id"
    t.index ["mobile"], name: "index_users_on_mobile", unique: true
    t.index ["parent_id"], name: "index_users_on_parent_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "vehicle_costs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id"
    t.date "month"
    t.float "price_unit"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["month"], name: "index_vehicle_costs_on_month", unique: true
    t.index ["user_id"], name: "index_vehicle_costs_on_user_id"
  end

  add_foreign_key "accident_reports", "departments"
  add_foreign_key "accident_reports", "kkbs"
  add_foreign_key "accident_reports", "users"
  add_foreign_key "accident_reports", "users", column: "audited_by_id"
  add_foreign_key "accident_reports", "users", column: "created_by_id"
  add_foreign_key "accident_reports", "users", column: "dosed_by_id"
  add_foreign_key "accident_reports", "users", column: "updated_by_id"
  add_foreign_key "accounting_items", "companies"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_extensions", "active_storage_attachments", column: "file_id"
  add_foreign_key "active_storage_extensions", "users", column: "created_by_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "allowance_payments", "allowances"
  add_foreign_key "allowance_payments", "users"
  add_foreign_key "allowance_payments", "users", column: "created_by_id"
  add_foreign_key "allowance_payments", "users", column: "updated_by_id"
  add_foreign_key "allowance_users", "allowances"
  add_foreign_key "allowance_users", "users"
  add_foreign_key "allowance_users", "users", column: "created_by_id"
  add_foreign_key "allowance_users", "users", column: "updated_by_id"
  add_foreign_key "allowances", "users", column: "created_by_id"
  add_foreign_key "allowances", "users", column: "updated_by_id"
  add_foreign_key "app_values", "basic_apps"
  add_foreign_key "area_daily_comments", "areas"
  add_foreign_key "area_daily_comments", "users", column: "created_by_id"
  add_foreign_key "area_daily_comments", "users", column: "updated_by_id"
  add_foreign_key "areas_regions", "areas"
  add_foreign_key "areas_regions", "regions"
  add_foreign_key "assessment_answers", "assessment_questions"
  add_foreign_key "assessment_answers", "assessments"
  add_foreign_key "assessment_categories", "assessment_patterns"
  add_foreign_key "assessment_categories", "assessment_questions"
  add_foreign_key "assessment_question_groups", "assessment_groups"
  add_foreign_key "assessment_question_groups", "assessment_questions"
  add_foreign_key "assessments", "users"
  add_foreign_key "assessments", "users", column: "evaluator_id"
  add_foreign_key "assign_shops", "departments"
  add_foreign_key "assign_shops", "users"
  add_foreign_key "attachment_files", "users"
  add_foreign_key "attachments", "kkbs"
  add_foreign_key "auth_action_groups", "auth_actions"
  add_foreign_key "auth_action_groups", "groups"
  add_foreign_key "auth_action_users", "auth_actions"
  add_foreign_key "auth_action_users", "users"
  add_foreign_key "auth_actions", "auth_actions", column: "parent_id"
  add_foreign_key "auth_actions", "groups"
  add_foreign_key "bank_accounts", "users"
  add_foreign_key "bank_book_amounts", "departments"
  add_foreign_key "bank_book_amounts", "expense_bank_accounts"
  add_foreign_key "bank_book_procs", "departments"
  add_foreign_key "bank_book_procs", "expense_bank_accounts"
  add_foreign_key "bank_book_procs", "users", column: "finally_approved_by_id"
  add_foreign_key "bank_book_procs", "users", column: "fixed_by_id"
  add_foreign_key "bank_book_procs", "users", column: "updated_by_id"
  add_foreign_key "bank_books", "departments"
  add_foreign_key "bank_books", "departments", column: "sub_department_id"
  add_foreign_key "bank_books", "expense_bank_accounts"
  add_foreign_key "bank_books", "expense_items"
  add_foreign_key "bank_books", "users", column: "edit_user_id"
  add_foreign_key "basic_apps", "users"
  add_foreign_key "basic_apps", "users", column: "approved_by_id"
  add_foreign_key "basic_apps", "users", column: "pre_approved_by_id"
  add_foreign_key "biz_bank_accounts", "business_connections"
  add_foreign_key "biz_bank_accounts", "users", column: "created_by_id"
  add_foreign_key "biz_bank_accounts", "users", column: "updated_by_id"
  add_foreign_key "block_values", "shift_blocks"
  add_foreign_key "bugyo_mappings", "departments"
  add_foreign_key "bugyo_mappings", "departments", column: "bugyo_department_id"
  add_foreign_key "business_connection_accounting_items", "accounting_items"
  add_foreign_key "business_connection_accounting_items", "business_connections"
  add_foreign_key "business_connections", "companies"
  add_foreign_key "business_connections", "departments"
  add_foreign_key "business_connections", "users", column: "created_by_id"
  add_foreign_key "business_connections", "users", column: "updated_by_id"
  add_foreign_key "business_divisions", "departments"
  add_foreign_key "business_divisions", "organization_units"
  add_foreign_key "calendar_dest_designs", "destinations"
  add_foreign_key "calendar_dest_designs", "users", column: "created_by_id"
  add_foreign_key "calendar_dest_designs", "users", column: "updated_by_id"
  add_foreign_key "calendar_dests", "users", column: "created_by_id"
  add_foreign_key "calendar_dests", "users", column: "updated_by_id"
  add_foreign_key "capture_categories", "users", column: "created_by_id"
  add_foreign_key "capture_categories", "users", column: "updated_by_id"
  add_foreign_key "cash_counts", "departments"
  add_foreign_key "cash_reserves", "daily_journal_items"
  add_foreign_key "cash_reserves", "departments"
  add_foreign_key "cash_reserves", "users", column: "created_by_id"
  add_foreign_key "cash_reserves", "users", column: "updated_by_id"
  add_foreign_key "chain_store_prescriptions", "departments"
  add_foreign_key "chain_store_prescriptions", "users", column: "created_by_id"
  add_foreign_key "chain_store_prescriptions", "users", column: "updated_by_id"
  add_foreign_key "change_logs", "users", column: "created_by_id"
  add_foreign_key "checker_area_groups", "areas"
  add_foreign_key "checker_area_groups", "groups"
  add_foreign_key "chief_report_changes", "chief_reports"
  add_foreign_key "chief_report_changes", "departments"
  add_foreign_key "chief_report_details", "chief_reports"
  add_foreign_key "chief_report_details", "departments"
  add_foreign_key "chief_report_users", "chief_reports"
  add_foreign_key "chief_report_users", "users"
  add_foreign_key "chief_reports", "users", column: "created_by_id"
  add_foreign_key "chief_reports", "users", column: "updated_by_id"
  add_foreign_key "commuting_routes", "shops"
  add_foreign_key "commuting_routes", "users"
  add_foreign_key "commuting_times", "departments"
  add_foreign_key "commuting_times", "users"
  add_foreign_key "companies", "companies", column: "parent_id"
  add_foreign_key "companies", "users", column: "document_representative_id"
  add_foreign_key "company_bank_accounts", "accounting_items"
  add_foreign_key "company_bank_accounts", "companies"
  add_foreign_key "company_bank_accounts", "departments"
  add_foreign_key "company_housings", "contract_documents"
  add_foreign_key "company_housings", "departments", column: "cohabitant_dep_id"
  add_foreign_key "company_housings", "departments", column: "contractor_dep_id"
  add_foreign_key "company_housings", "users", column: "cohabitant_id"
  add_foreign_key "company_housings", "users", column: "contractor_id"
  add_foreign_key "company_housings", "users", column: "created_by_id"
  add_foreign_key "company_housings", "users", column: "staff_id"
  add_foreign_key "company_housings", "users", column: "updated_by_id"
  add_foreign_key "company_registrations", "companies"
  add_foreign_key "company_registrations", "users", column: "updated_by_id"
  add_foreign_key "company_representatives", "companies"
  add_foreign_key "company_representatives", "users", column: "representative_id"
  add_foreign_key "company_representatives", "users", column: "updated_by_id"
  add_foreign_key "concerned_customers", "users"
  add_foreign_key "concerned_shops", "users"
  add_foreign_key "contract_documents", "business_connections"
  add_foreign_key "contract_documents", "contract_documents", column: "parent_id"
  add_foreign_key "contract_documents", "contract_types"
  add_foreign_key "contract_documents", "departments"
  add_foreign_key "contract_documents", "users", column: "created_by_id"
  add_foreign_key "contract_documents", "users", column: "updated_by_id"
  add_foreign_key "contract_type_groups", "contract_types"
  add_foreign_key "contract_type_groups", "groups"
  add_foreign_key "contract_type_users", "contract_types"
  add_foreign_key "contract_type_users", "users"
  add_foreign_key "copayment_adjust_details", "copayment_adjust_details", column: "receivable_id"
  add_foreign_key "copayment_adjust_details", "departments"
  add_foreign_key "copayment_adjust_details", "users", column: "created_by_id"
  add_foreign_key "copayment_adjust_details", "users", column: "updated_by_id"
  add_foreign_key "daily_cash_summaries", "departments"
  add_foreign_key "daily_cash_summaries", "users", column: "created_by_id"
  add_foreign_key "daily_cash_summaries", "users", column: "updated_by_id"
  add_foreign_key "daily_closings", "departments"
  add_foreign_key "daily_closings", "users", column: "confirmed_by_id"
  add_foreign_key "daily_closings", "users", column: "count_checked_by_id"
  add_foreign_key "daily_closings", "users", column: "counted_by_id"
  add_foreign_key "daily_closings", "users", column: "created_by_id"
  add_foreign_key "daily_closings", "users", column: "finally_approved_by_id"
  add_foreign_key "daily_closings", "users", column: "input_by_id"
  add_foreign_key "daily_closings", "users", column: "timerecord_input_by_id"
  add_foreign_key "daily_closings", "users", column: "updated_by_id"
  add_foreign_key "daily_comments", "users", column: "created_by_id"
  add_foreign_key "daily_comments", "users", column: "updated_by_id"
  add_foreign_key "daily_journal_items", "companies"
  add_foreign_key "daily_sales_confirms", "departments"
  add_foreign_key "daily_sales_confirms", "users", column: "created_by_id"
  add_foreign_key "daily_sales_confirms", "users", column: "updated_by_id"
  add_foreign_key "department_additions", "departments"
  add_foreign_key "department_area_infos", "areas"
  add_foreign_key "department_area_infos", "departments"
  add_foreign_key "department_bank_account_balances", "department_bank_accounts"
  add_foreign_key "department_bank_accounts", "companies"
  add_foreign_key "department_bank_accounts", "departments"
  add_foreign_key "department_bank_accounts", "departments", column: "nearest_department_id"
  add_foreign_key "department_biz_bank_accounts", "biz_bank_accounts"
  add_foreign_key "department_biz_bank_accounts", "business_connections"
  add_foreign_key "department_biz_bank_accounts", "departments"
  add_foreign_key "department_budgets", "departments"
  add_foreign_key "department_business_connections", "accounting_items"
  add_foreign_key "department_business_connections", "business_connections"
  add_foreign_key "department_business_connections", "departments"
  add_foreign_key "department_constants", "departments"
  add_foreign_key "department_count_rules", "departments"
  add_foreign_key "department_count_rules", "users", column: "created_by_id"
  add_foreign_key "department_count_rules", "users", column: "updated_by_id"
  add_foreign_key "department_monthly_reports", "departments"
  add_foreign_key "department_pharmacists", "departments"
  add_foreign_key "department_pharmacists", "users"
  add_foreign_key "department_uniform_numbers", "departments"
  add_foreign_key "department_uniform_numbers", "uniform_numbers"
  add_foreign_key "departments", "companies"
  add_foreign_key "departments", "companies", column: "company2_id"
  add_foreign_key "departments", "department_display_types", column: "display_type_id"
  add_foreign_key "departments", "departments", column: "parent_id"
  add_foreign_key "departments", "destinations"
  add_foreign_key "departments", "kkbs"
  add_foreign_key "departments", "map_locations", column: "location_address_id"
  add_foreign_key "departments", "map_locations", column: "location_station_id"
  add_foreign_key "departments", "user_segments"
  add_foreign_key "departments", "users", column: "chief2_id"
  add_foreign_key "departments", "users", column: "chief_id"
  add_foreign_key "departments", "users", column: "edit_user_id"
  add_foreign_key "departments", "users", column: "element_leader_id"
  add_foreign_key "departments", "users", column: "fire_manager_id"
  add_foreign_key "departments", "users", column: "login_user_id"
  add_foreign_key "departments", "users", column: "representative_id"
  add_foreign_key "departments", "users", column: "secondary_id"
  add_foreign_key "departments", "users", column: "tertiary_id"
  add_foreign_key "deployments", "departments"
  add_foreign_key "deployments", "users", column: "created_by_id"
  add_foreign_key "deployments", "users", column: "updated_by_id"
  add_foreign_key "deposit_histories", "departments"
  add_foreign_key "deposit_histories", "users"
  add_foreign_key "deposit_histories", "users", column: "created_by_id"
  add_foreign_key "deposit_histories", "users", column: "updated_by_id"
  add_foreign_key "division_infos", "companies"
  add_foreign_key "early_work_hours", "departments"
  add_foreign_key "early_work_hours", "users"
  add_foreign_key "early_work_hours", "users", column: "approver_id"
  add_foreign_key "early_work_hours", "users", column: "creator_id"
  add_foreign_key "event_detail_instructions", "event_details"
  add_foreign_key "event_detail_instructions", "instructions"
  add_foreign_key "event_details", "departments"
  add_foreign_key "event_details", "departments", column: "former_department_id"
  add_foreign_key "event_details", "event_headers"
  add_foreign_key "event_details", "organization_units"
  add_foreign_key "event_details", "users"
  add_foreign_key "event_details", "users", column: "created_by_id"
  add_foreign_key "event_details", "users", column: "updated_by_id"
  add_foreign_key "event_headers", "users", column: "created_by_id"
  add_foreign_key "event_headers", "users", column: "updated_by_id"
  add_foreign_key "exchange_settings", "departments"
  add_foreign_key "exchange_settings", "users", column: "created_by_id"
  add_foreign_key "exchange_settings", "users", column: "updated_by_id"
  add_foreign_key "exclusive_controls", "users", column: "locked_by_id"
  add_foreign_key "expense_bank_accounts", "business_connections"
  add_foreign_key "expense_bank_accounts", "departments"
  add_foreign_key "expense_files", "departments"
  add_foreign_key "expense_files", "users"
  add_foreign_key "expense_files", "users", column: "updated_by_id"
  add_foreign_key "expense_items", "accounting_items"
  add_foreign_key "expense_items", "companies"
  add_foreign_key "file_record_groups", "file_records"
  add_foreign_key "file_record_groups", "groups"
  add_foreign_key "file_record_users", "file_records"
  add_foreign_key "file_record_users", "users"
  add_foreign_key "file_records", "users", column: "created_by_id"
  add_foreign_key "file_records", "users", column: "updated_by_id"
  add_foreign_key "func_defs", "users", column: "updated_by_id"
  add_foreign_key "gen_calendar_dests", "destinations"
  add_foreign_key "gen_calendar_dests", "users", column: "created_by_id"
  add_foreign_key "gen_calendar_dests", "users", column: "updated_by_id"
  add_foreign_key "gen_shift_dests", "destinations"
  add_foreign_key "gen_shift_dests", "users", column: "created_by_id"
  add_foreign_key "gen_shift_dests", "users", column: "updated_by_id"
  add_foreign_key "gen_shift_users", "destinations"
  add_foreign_key "gen_shift_users", "users"
  add_foreign_key "gen_shift_users", "users", column: "created_by_id"
  add_foreign_key "gen_shift_users", "users", column: "updated_by_id"
  add_foreign_key "greenlines", "users", column: "updated_by_id"
  add_foreign_key "group_owners", "groups"
  add_foreign_key "group_owners", "users"
  add_foreign_key "group_regions", "groups"
  add_foreign_key "group_regions", "regions"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "groups", "companies"
  add_foreign_key "groups", "users"
  add_foreign_key "groups", "users", column: "created_by_id"
  add_foreign_key "groups", "users", column: "updated_by_id"
  add_foreign_key "haken_shop_messages", "haken_shops"
  add_foreign_key "haken_shop_messages", "kkb_messages"
  add_foreign_key "haken_shop_messages", "users"
  add_foreign_key "haken_shops", "destinations"
  add_foreign_key "holiday_categories", "destinations"
  add_foreign_key "holiday_check_comments", "users"
  add_foreign_key "holiday_ratios", "regions"
  add_foreign_key "holiday_ratios", "users", column: "created_by_id"
  add_foreign_key "holiday_ratios", "users", column: "updated_by_id"
  add_foreign_key "holiday_works", "users"
  add_foreign_key "housing_other_costs", "company_housings"
  add_foreign_key "housing_payment_items", "housing_payments"
  add_foreign_key "housing_payments", "company_housings"
  add_foreign_key "housing_payments", "users", column: "created_by_id"
  add_foreign_key "housing_payments", "users", column: "updated_by_id"
  add_foreign_key "instructions", "departments"
  add_foreign_key "instructions", "groups", column: "asked_group_id"
  add_foreign_key "instructions", "users"
  add_foreign_key "instructions", "users", column: "asked_user_id"
  add_foreign_key "instructions", "users", column: "checker_id"
  add_foreign_key "instructions", "users", column: "created_by_id"
  add_foreign_key "instructions", "users", column: "reminder_id"
  add_foreign_key "instructions", "users", column: "requester_id"
  add_foreign_key "instructions", "users", column: "updated_by_id"
  add_foreign_key "internal_histories", "departments"
  add_foreign_key "internal_histories", "internal_history_items", column: "item_id"
  add_foreign_key "internal_histories", "users"
  add_foreign_key "internal_histories", "users", column: "created_by_id"
  add_foreign_key "internal_history_item_groups", "groups"
  add_foreign_key "internal_history_item_groups", "internal_history_items"
  add_foreign_key "internal_history_item_users", "internal_history_items"
  add_foreign_key "internal_history_item_users", "users"
  add_foreign_key "invoice_amounts", "department_business_connections"
  add_foreign_key "invoice_amounts", "expense_files"
  add_foreign_key "invoice_amounts", "users", column: "created_by_id"
  add_foreign_key "invoice_amounts", "users", column: "updated_by_id"
  add_foreign_key "invoice_details", "invoice_headers"
  add_foreign_key "invoice_headers", "companies"
  add_foreign_key "invoice_headers", "users", column: "created_by_id"
  add_foreign_key "invoice_headers", "users", column: "updated_by_id"
  add_foreign_key "journal_entry_patterns", "users", column: "created_by_id"
  add_foreign_key "journal_entry_patterns", "users", column: "updated_by_id"
  add_foreign_key "journal_items", "users"
  add_foreign_key "kkb_categories", "users"
  add_foreign_key "kkb_category_groups", "groups"
  add_foreign_key "kkb_category_groups", "kkb_categories"
  add_foreign_key "kkb_category_users", "kkb_categories"
  add_foreign_key "kkb_category_users", "users"
  add_foreign_key "kkb_commenters", "kkbs"
  add_foreign_key "kkb_commenters", "users"
  add_foreign_key "kkb_commuting_exp_items", "accounting_items"
  add_foreign_key "kkb_commuting_exp_items", "departments"
  add_foreign_key "kkb_commuting_exp_items", "expense_items"
  add_foreign_key "kkb_commuting_exp_items", "kkb_commuting_exps"
  add_foreign_key "kkb_commuting_exps", "kkbs"
  add_foreign_key "kkb_commuting_exps", "users"
  add_foreign_key "kkb_commuting_exps", "users", column: "finally_approved_by_id"
  add_foreign_key "kkb_commuting_exps", "users", column: "first_approved_by_id"
  add_foreign_key "kkb_confirms", "kkbs"
  add_foreign_key "kkb_confirms", "users"
  add_foreign_key "kkb_custom_configs", "kkbs"
  add_foreign_key "kkb_custom_configs", "users"
  add_foreign_key "kkb_dests", "kkbs"
  add_foreign_key "kkb_dests", "users"
  add_foreign_key "kkb_doc_categories", "groups"
  add_foreign_key "kkb_doc_categories", "kkb_doc_categories", column: "parent_id"
  add_foreign_key "kkb_doc_categories", "kkbs"
  add_foreign_key "kkb_doc_categories", "users"
  add_foreign_key "kkb_doc_tags", "kkb_docs"
  add_foreign_key "kkb_docs", "users", column: "created_by_id"
  add_foreign_key "kkb_docs", "users", column: "updated_by_id"
  add_foreign_key "kkb_favorites", "kkbs"
  add_foreign_key "kkb_favorites", "users"
  add_foreign_key "kkb_file_lists", "kkbs"
  add_foreign_key "kkb_file_lists", "users"
  add_foreign_key "kkb_file_project_items", "users"
  add_foreign_key "kkb_file_projects", "kkbs"
  add_foreign_key "kkb_file_projects", "users"
  add_foreign_key "kkb_fixed_processes", "users"
  add_foreign_key "kkb_follow_comments", "kkbs"
  add_foreign_key "kkb_follow_comments", "users"
  add_foreign_key "kkb_follows", "kkbs"
  add_foreign_key "kkb_follows", "users"
  add_foreign_key "kkb_generators", "kkbs"
  add_foreign_key "kkb_generic_form_contents", "kkb_generic_forms"
  add_foreign_key "kkb_generic_form_contents", "kkbs"
  add_foreign_key "kkb_generic_form_contents", "users"
  add_foreign_key "kkb_generic_forms", "users"
  add_foreign_key "kkb_groups", "groups"
  add_foreign_key "kkb_groups", "kkbs"
  add_foreign_key "kkb_links", "kkbs"
  add_foreign_key "kkb_links", "users"
  add_foreign_key "kkb_members", "users"
  add_foreign_key "kkb_memos", "kkbs"
  add_foreign_key "kkb_memos", "users"
  add_foreign_key "kkb_messages", "groups", column: "dest_group_id"
  add_foreign_key "kkb_messages", "groups", column: "src_group_id"
  add_foreign_key "kkb_messages", "users"
  add_foreign_key "kkb_misc_exp_items", "accounting_items"
  add_foreign_key "kkb_misc_exp_items", "business_connections"
  add_foreign_key "kkb_misc_exp_items", "departments"
  add_foreign_key "kkb_misc_exp_items", "kkb_misc_exps"
  add_foreign_key "kkb_misc_exps", "concerned_customers"
  add_foreign_key "kkb_misc_exps", "concerned_shops"
  add_foreign_key "kkb_misc_exps", "departments"
  add_foreign_key "kkb_misc_exps", "expense_items"
  add_foreign_key "kkb_misc_exps", "kkbs"
  add_foreign_key "kkb_misc_exps", "users"
  add_foreign_key "kkb_nonshift_categories", "users"
  add_foreign_key "kkb_nonshift_checks", "kkb_nonshift_categories"
  add_foreign_key "kkb_nonshift_checks", "users"
  add_foreign_key "kkb_nonshift_users", "kkb_nonshift_categories"
  add_foreign_key "kkb_nonshift_users", "kkb_nonshift_works"
  add_foreign_key "kkb_nonshift_users", "users"
  add_foreign_key "kkb_nonshift_works", "users"
  add_foreign_key "kkb_optional_functions", "kkb_categories"
  add_foreign_key "kkb_parametrics", "kkbs"
  add_foreign_key "kkb_related_haken_shops", "haken_shops"
  add_foreign_key "kkb_related_haken_shops", "kkbs"
  add_foreign_key "kkb_routine_dates", "kkb_routines"
  add_foreign_key "kkb_routine_dates", "users"
  add_foreign_key "kkb_routine_kkbs", "kkb_routines"
  add_foreign_key "kkb_routine_kkbs", "kkbs"
  add_foreign_key "kkb_routine_wdays", "kkb_routines"
  add_foreign_key "kkb_routine_wdays", "users"
  add_foreign_key "kkb_routine_weeks", "kkb_routines"
  add_foreign_key "kkb_routine_weeks", "users"
  add_foreign_key "kkb_routines", "users"
  add_foreign_key "kkb_sekisyo_checks", "kkbs"
  add_foreign_key "kkb_sekisyo_checks", "users"
  add_foreign_key "kkb_stages", "users"
  add_foreign_key "kkb_time_limits", "users"
  add_foreign_key "kkb_urls", "kkbs"
  add_foreign_key "kkb_urls", "users"
  add_foreign_key "kkb_user_categories", "users"
  add_foreign_key "kkb_work_rules", "companies"
  add_foreign_key "kkb_work_rules", "kkbs"
  add_foreign_key "kkbs", "groups"
  add_foreign_key "kkbs", "users"
  add_foreign_key "labor_cost_payments", "users"
  add_foreign_key "labor_cost_payments", "users", column: "created_by_id"
  add_foreign_key "labor_cost_payments", "users", column: "updated_by_id"
  add_foreign_key "ma_document_types", "users", column: "created_by_id"
  add_foreign_key "ma_document_types", "users", column: "updated_by_id"
  add_foreign_key "ma_header_comments", "companies"
  add_foreign_key "ma_header_comments", "ma_headers"
  add_foreign_key "ma_header_comments", "users"
  add_foreign_key "ma_header_comments", "users", column: "created_by_id"
  add_foreign_key "ma_header_comments", "users", column: "updated_by_id"
  add_foreign_key "ma_headers", "kkbs", column: "kkb_fixed_id"
  add_foreign_key "ma_headers", "kkbs", column: "kkb_progress_id"
  add_foreign_key "ma_headers", "users", column: "created_by_id"
  add_foreign_key "ma_headers", "users", column: "updated_by_id"
  add_foreign_key "ma_meeting_members", "ma_header_comments"
  add_foreign_key "ma_meeting_members", "users"
  add_foreign_key "ma_progress_values", "ma_headers"
  add_foreign_key "ma_progress_values", "users"
  add_foreign_key "ma_progress_values", "users", column: "created_by_id"
  add_foreign_key "ma_progress_values", "users", column: "updated_by_id"
  add_foreign_key "ma_project_documents", "ma_document_types"
  add_foreign_key "ma_project_documents", "ma_projects"
  add_foreign_key "ma_project_documents", "ma_stores"
  add_foreign_key "ma_project_documents", "users", column: "created_by_id"
  add_foreign_key "ma_project_documents", "users", column: "updated_by_id"
  add_foreign_key "ma_projects", "ma_headers"
  add_foreign_key "ma_projects", "users", column: "created_by_id"
  add_foreign_key "ma_projects", "users", column: "updated_by_id"
  add_foreign_key "ma_shared_items", "users", column: "created_by_id"
  add_foreign_key "ma_shared_items", "users", column: "updated_by_id"
  add_foreign_key "ma_shared_values", "ma_headers"
  add_foreign_key "ma_shared_values", "ma_shared_items", column: "item_id"
  add_foreign_key "ma_shared_values", "users", column: "created_by_id"
  add_foreign_key "ma_shared_values", "users", column: "updated_by_id"
  add_foreign_key "ma_store_work_hours", "ma_stores"
  add_foreign_key "ma_store_work_hours", "users", column: "created_by_id"
  add_foreign_key "ma_store_work_hours", "users", column: "updated_by_id"
  add_foreign_key "ma_stores", "departments"
  add_foreign_key "ma_stores", "ma_projects"
  add_foreign_key "ma_stores", "ma_stores", column: "parent_id"
  add_foreign_key "ma_stores", "users", column: "created_by_id"
  add_foreign_key "ma_stores", "users", column: "updated_by_id"
  add_foreign_key "mail_queues", "users", column: "created_by_id"
  add_foreign_key "manager_days", "users"
  add_foreign_key "manager_days", "users", column: "created_by_id"
  add_foreign_key "manager_days", "users", column: "updated_by_id"
  add_foreign_key "medicine_exchange_comments", "departments"
  add_foreign_key "medicine_exchange_comments", "medicine_exchanges"
  add_foreign_key "medicine_exchanges", "departments"
  add_foreign_key "member_groups", "groups"
  add_foreign_key "member_users", "users"
  add_foreign_key "modify_departments", "departments"
  add_foreign_key "modify_departments", "users", column: "created_by_id"
  add_foreign_key "modify_departments", "users", column: "updated_by_id"
  add_foreign_key "modify_exchange_settings", "departments"
  add_foreign_key "modify_exchange_settings", "users", column: "created_by_id"
  add_foreign_key "modify_exchange_settings", "users", column: "updated_by_id"
  add_foreign_key "modify_time_cards", "departments"
  add_foreign_key "modify_time_cards", "time_cards"
  add_foreign_key "modify_time_cards", "time_records"
  add_foreign_key "modify_time_cards", "users", column: "confirmed_by_id"
  add_foreign_key "modify_users", "users"
  add_foreign_key "modify_users", "users", column: "edit_user_id"
  add_foreign_key "nearby_clinic_departments", "clinical_departments"
  add_foreign_key "nearby_clinic_departments", "nearby_clinics"
  add_foreign_key "nearby_clinic_stations", "map_locations", column: "location_station_id"
  add_foreign_key "nearby_clinic_stations", "nearby_clinics"
  add_foreign_key "nearby_clinics", "departments"
  add_foreign_key "nearby_clinics", "map_locations"
  add_foreign_key "nearby_clinics", "users", column: "contact_id"
  add_foreign_key "nearby_clinics", "users", column: "created_by_id"
  add_foreign_key "nearby_clinics", "users", column: "disaster_id"
  add_foreign_key "nearby_clinics", "users", column: "updated_by_id"
  add_foreign_key "nearby_distances", "departments"
  add_foreign_key "nearby_distances", "map_locations"
  add_foreign_key "nearby_home_care_stations", "map_locations", column: "location_station_id"
  add_foreign_key "nearby_home_care_stations", "nearby_home_cares"
  add_foreign_key "nearby_home_cares", "departments"
  add_foreign_key "nearby_home_cares", "map_locations"
  add_foreign_key "nearby_home_cares", "users", column: "created_by_id"
  add_foreign_key "nearby_home_cares", "users", column: "updated_by_id"
  add_foreign_key "nearby_key_figures", "nearby_clinics"
  add_foreign_key "nearby_key_figures", "users", column: "created_by_id"
  add_foreign_key "nearby_key_figures", "users", column: "updated_by_id"
  add_foreign_key "nkk_days", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "users", column: "author_id"
  add_foreign_key "numbers_comments", "users", column: "edit_user_id"
  add_foreign_key "off_hours_reports", "departments"
  add_foreign_key "off_hours_reports", "kkbs"
  add_foreign_key "off_hours_reports", "users"
  add_foreign_key "off_hours_reports", "users", column: "created_by_id"
  add_foreign_key "off_hours_reports", "users", column: "updated_by_id"
  add_foreign_key "op_calendar_dest_designs", "calendar_dest_designs"
  add_foreign_key "op_calendar_dest_designs", "shift_operations"
  add_foreign_key "op_calendar_dests", "calendar_dests"
  add_foreign_key "op_calendar_dests", "shift_operations"
  add_foreign_key "op_shift_dest_designs", "shift_dest_designs"
  add_foreign_key "op_shift_dest_designs", "shift_operations"
  add_foreign_key "op_shift_dests", "shift_dests"
  add_foreign_key "op_shift_dests", "shift_operations"
  add_foreign_key "op_shift_user_designs", "shift_operations"
  add_foreign_key "op_shift_user_designs", "shift_user_designs"
  add_foreign_key "op_shift_users", "shift_operations"
  add_foreign_key "op_shift_users", "shift_users"
  add_foreign_key "organization_knowhows", "organization_units"
  add_foreign_key "organization_unit_users", "organization_units"
  add_foreign_key "organization_unit_users", "users"
  add_foreign_key "organization_units", "organization_units", column: "parent_id"
  add_foreign_key "organization_units", "user_segments"
  add_foreign_key "organization_units", "users", column: "manager_id"
  add_foreign_key "over_time_apps", "departments"
  add_foreign_key "over_time_apps", "users"
  add_foreign_key "over_time_apps", "users", column: "confirmed_by_id"
  add_foreign_key "paid_holiday_counts", "users", column: "created_by_id"
  add_foreign_key "payment_destinations", "users"
  add_foreign_key "payment_destinations", "users", column: "created_by_id"
  add_foreign_key "payment_destinations", "users", column: "updated_by_id"
  add_foreign_key "payment_detail_items", "accounting_items"
  add_foreign_key "payment_detail_items", "departments"
  add_foreign_key "payment_detail_items", "payment_details"
  add_foreign_key "payment_details", "payment_headers"
  add_foreign_key "payment_headers", "accounting_items"
  add_foreign_key "payment_headers", "company_bank_accounts"
  add_foreign_key "payment_headers", "departments", column: "credit_department_id"
  add_foreign_key "payment_headers", "division_infos", column: "division_customer_id"
  add_foreign_key "payment_headers", "division_infos", column: "division_evaluated_id"
  add_foreign_key "payment_headers", "division_infos", column: "division_project_id"
  add_foreign_key "payment_headers", "division_infos", column: "division_shop_id"
  add_foreign_key "payment_headers", "payment_destinations"
  add_foreign_key "payment_headers", "users"
  add_foreign_key "payment_headers", "users", column: "created_by_id"
  add_foreign_key "payment_headers", "users", column: "updated_by_id"
  add_foreign_key "performance_appeals", "departments"
  add_foreign_key "performance_appeals", "users"
  add_foreign_key "performance_appeals", "users", column: "created_by_id"
  add_foreign_key "performance_appeals", "users", column: "updated_by_id"
  add_foreign_key "personal_contacts", "users"
  add_foreign_key "personnel_change_procs", "users"
  add_foreign_key "personnel_changes", "areas"
  add_foreign_key "personnel_changes", "destinations", column: "move_from_id"
  add_foreign_key "personnel_changes", "destinations", column: "move_to_id"
  add_foreign_key "personnel_changes", "users"
  add_foreign_key "personnel_changes", "users", column: "created_by_id"
  add_foreign_key "personnel_changes", "users", column: "updated_by_id"
  add_foreign_key "pharmacist_workflow_statuses", "departments"
  add_foreign_key "phones", "departments"
  add_foreign_key "phones", "users"
  add_foreign_key "prescription_average_values", "prescription_averages"
  add_foreign_key "prescription_averages", "departments"
  add_foreign_key "prescription_dailies", "departments"
  add_foreign_key "prescription_monthlies", "departments"
  add_foreign_key "prescription_monthlies", "users", column: "created_by_id"
  add_foreign_key "prescription_monthlies", "users", column: "updated_by_id"
  add_foreign_key "prescription_time_zones", "departments"
  add_foreign_key "prescription_time_zones", "users", column: "created_by_id"
  add_foreign_key "prescription_time_zones", "users", column: "updated_by_id"
  add_foreign_key "prescription_years", "departments"
  add_foreign_key "priority_tasks", "kkb_categories"
  add_foreign_key "priority_tasks", "kkbs"
  add_foreign_key "priority_tasks", "users"
  add_foreign_key "priority_tasks", "users", column: "checker_id"
  add_foreign_key "promise_items", "func_defs"
  add_foreign_key "promise_items", "promise_targets"
  add_foreign_key "promise_items", "users"
  add_foreign_key "promise_items", "users", column: "created_by_id"
  add_foreign_key "promise_items", "users", column: "requested_by_id"
  add_foreign_key "promise_items", "users", column: "updated_by_id"
  add_foreign_key "promise_procs", "promise_targets"
  add_foreign_key "promise_procs", "users", column: "confirmed_by_id"
  add_foreign_key "promise_targets", "users", column: "created_by_id"
  add_foreign_key "prospective_employees", "companies"
  add_foreign_key "prospective_employees", "companies", column: "former_company_id"
  add_foreign_key "prospective_employees", "departments"
  add_foreign_key "prospective_employees", "deployments"
  add_foreign_key "prospective_employees", "organization_units"
  add_foreign_key "prospective_employees", "salary_types"
  add_foreign_key "prospective_employees", "user_divisions"
  add_foreign_key "prospective_employees", "user_roles"
  add_foreign_key "prospective_employees", "user_segments"
  add_foreign_key "prospective_employees", "users"
  add_foreign_key "prospective_employees", "users", column: "created_by_id"
  add_foreign_key "prospective_employees", "users", column: "updated_by_id"
  add_foreign_key "prospective_payments", "prospective_employees"
  add_foreign_key "prospective_payments", "users", column: "created_by_id"
  add_foreign_key "prospective_payments", "users", column: "updated_by_id"
  add_foreign_key "prospective_work_hours", "prospective_employees"
  add_foreign_key "prospective_work_hours", "users", column: "created_by_id"
  add_foreign_key "prospective_work_hours", "users", column: "updated_by_id"
  add_foreign_key "questionnaire_items", "questionnaire_items", column: "parent_id"
  add_foreign_key "questionnaire_items", "questionnaires"
  add_foreign_key "questionnaire_kkbs", "kkbs"
  add_foreign_key "questionnaire_kkbs", "questionnaires"
  add_foreign_key "questionnaire_kkbs", "users"
  add_foreign_key "questionnaire_values", "kkbs"
  add_foreign_key "questionnaire_values", "questionnaire_items"
  add_foreign_key "questionnaire_values", "users"
  add_foreign_key "questionnaires", "users"
  add_foreign_key "recruit_pharmacist_comments", "recruit_pharmacists"
  add_foreign_key "recruit_pharmacist_comments", "users", column: "created_by_id"
  add_foreign_key "recruit_pharmacist_comments", "users", column: "updated_by_id"
  add_foreign_key "recruit_pharmacist_selections", "recruit_pharmacists"
  add_foreign_key "recruit_pharmacist_selections", "users"
  add_foreign_key "recruit_pharmacists", "areas"
  add_foreign_key "recruit_pharmacists", "prospective_employees"
  add_foreign_key "recruit_pharmacists", "users", column: "created_by_id"
  add_foreign_key "recruit_pharmacists", "users", column: "interviewer_id"
  add_foreign_key "recruit_pharmacists", "users", column: "updated_by_id"
  add_foreign_key "recruit_shift_designs", "recruit_pharmacists"
  add_foreign_key "recruit_shift_designs", "users", column: "created_by_id"
  add_foreign_key "recruit_shift_designs", "users", column: "updated_by_id"
  add_foreign_key "region_daily_comments", "regions"
  add_foreign_key "region_daily_comments", "users", column: "created_by_id"
  add_foreign_key "region_daily_comments", "users", column: "updated_by_id"
  add_foreign_key "registered_commuting_options", "departments"
  add_foreign_key "registered_commuting_options", "users"
  add_foreign_key "registered_commuting_options", "users", column: "accepted_by_id"
  add_foreign_key "registered_pharmacists", "users", column: "created_by_id"
  add_foreign_key "registered_pharmacists", "users", column: "updated_by_id"
  add_foreign_key "reibai_shifts", "departments"
  add_foreign_key "reibai_shifts", "users"
  add_foreign_key "reibai_stores", "departments"
  add_foreign_key "reibai_stores", "users", column: "created_by_id"
  add_foreign_key "reibai_stores", "users", column: "updated_by_id"
  add_foreign_key "release_info_users", "release_infos"
  add_foreign_key "release_info_users", "users"
  add_foreign_key "release_infos", "users", column: "created_by_id"
  add_foreign_key "release_infos", "users", column: "updated_by_id"
  add_foreign_key "reserve_capacity_dailies", "regions"
  add_foreign_key "reserve_capacity_regions", "regions"
  add_foreign_key "reserve_capacity_regions", "reserve_capacities"
  add_foreign_key "rest_time_cards", "departments"
  add_foreign_key "rest_time_cards", "time_records"
  add_foreign_key "rest_times", "users"
  add_foreign_key "rest_times", "users", column: "created_by_id"
  add_foreign_key "rest_times", "users", column: "updated_by_id"
  add_foreign_key "resume_items", "resume_items", column: "parent_id"
  add_foreign_key "resume_values", "resume_items"
  add_foreign_key "resume_values", "users"
  add_foreign_key "riding_times", "map_locations", column: "location_from_id"
  add_foreign_key "riding_times", "map_locations", column: "location_to_id"
  add_foreign_key "roster_area_comments", "areas"
  add_foreign_key "roster_area_defaults", "areas"
  add_foreign_key "roster_areas", "areas"
  add_foreign_key "roster_diff_comments", "departments"
  add_foreign_key "roster_diff_comments", "users", column: "edit_user_id"
  add_foreign_key "roster_shop_procs", "departments"
  add_foreign_key "roster_shop_procs", "users"
  add_foreign_key "roster_shops", "areas"
  add_foreign_key "roster_summaries", "areas"
  add_foreign_key "roster_user_procs", "users"
  add_foreign_key "roster_users", "departments"
  add_foreign_key "roster_users", "users"
  add_foreign_key "roster_users", "users", column: "updated_by_id"
  add_foreign_key "routine_task_items", "groups"
  add_foreign_key "routine_task_items", "users"
  add_foreign_key "routine_task_items", "users", column: "actor_id"
  add_foreign_key "routine_tasks", "groups"
  add_foreign_key "routine_tasks", "routine_task_items"
  add_foreign_key "routine_tasks", "users"
  add_foreign_key "routine_tasks", "users", column: "checker_id"
  add_foreign_key "salary_categories", "salary_categories", column: "parent_id"
  add_foreign_key "salary_category_item_users", "salary_category_items"
  add_foreign_key "salary_category_item_users", "users"
  add_foreign_key "salary_category_item_users", "users", column: "created_by_id"
  add_foreign_key "salary_category_item_users", "users", column: "updated_by_id"
  add_foreign_key "salary_category_items", "salary_categories"
  add_foreign_key "salary_payments", "companies"
  add_foreign_key "salary_payments", "users"
  add_foreign_key "salary_payments", "users", column: "created_by_id"
  add_foreign_key "salary_payments", "users", column: "updated_by_id"
  add_foreign_key "salary_revisions", "users"
  add_foreign_key "salary_revisions", "users", column: "created_by_id"
  add_foreign_key "salary_revisions", "users", column: "updated_by_id"
  add_foreign_key "salary_types", "users", column: "created_by_id"
  add_foreign_key "salary_types", "users", column: "updated_by_id"
  add_foreign_key "schedules", "groups"
  add_foreign_key "schedules", "kkbs"
  add_foreign_key "schedules", "users"
  add_foreign_key "seal_requests", "companies"
  add_foreign_key "seal_requests", "companies", column: "company2_id"
  add_foreign_key "seal_requests", "companies", column: "company3_id"
  add_foreign_key "seal_requests", "users"
  add_foreign_key "seal_requests", "users", column: "created_by_id"
  add_foreign_key "seal_requests", "users", column: "representative2_id"
  add_foreign_key "seal_requests", "users", column: "representative3_id"
  add_foreign_key "seal_requests", "users", column: "representative_id"
  add_foreign_key "seal_requests", "users", column: "sealed_by_id"
  add_foreign_key "seal_requests", "users", column: "updated_by_id"
  add_foreign_key "self_consumptions", "departments"
  add_foreign_key "self_consumptions", "users", column: "created_by_id"
  add_foreign_key "self_consumptions", "users", column: "updated_by_id"
  add_foreign_key "selling_expenses", "accounting_items"
  add_foreign_key "selling_expenses", "business_connections"
  add_foreign_key "selling_expenses", "departments"
  add_foreign_key "sent_mail_dests", "personal_contacts"
  add_foreign_key "sent_mail_dests", "sent_mail_histories"
  add_foreign_key "sent_mail_histories", "users", column: "sent_by_id"
  add_foreign_key "shared_document_comments", "shared_documents"
  add_foreign_key "shared_document_comments", "users"
  add_foreign_key "shared_document_groups", "groups"
  add_foreign_key "shared_document_groups", "shared_documents"
  add_foreign_key "shared_documents", "users", column: "created_by_id"
  add_foreign_key "sheet_items", "groups"
  add_foreign_key "sheet_items", "users"
  add_foreign_key "sheet_values", "sheet_items"
  add_foreign_key "sheet_values", "users"
  add_foreign_key "shift_arrangement_details", "shift_arrangements"
  add_foreign_key "shift_arrangement_details", "users", column: "created_by_id"
  add_foreign_key "shift_arrangement_details", "users", column: "updated_by_id"
  add_foreign_key "shift_arrangements", "users"
  add_foreign_key "shift_arrangements", "users", column: "created_by_id"
  add_foreign_key "shift_arrangements", "users", column: "updated_by_id"
  add_foreign_key "shift_backup_details", "destinations"
  add_foreign_key "shift_backup_details", "shift_backup_headers"
  add_foreign_key "shift_backup_details", "users"
  add_foreign_key "shift_block_summaries", "shift_blocks"
  add_foreign_key "shift_busy_days", "regions"
  add_foreign_key "shift_busy_days", "users", column: "created_by_id"
  add_foreign_key "shift_change_event_groups", "groups"
  add_foreign_key "shift_change_event_groups", "shift_change_events"
  add_foreign_key "shift_change_event_members", "shift_change_events"
  add_foreign_key "shift_change_event_members", "users"
  add_foreign_key "shift_change_events", "departments"
  add_foreign_key "shift_change_events", "users"
  add_foreign_key "shift_change_events", "users", column: "created_by_id"
  add_foreign_key "shift_change_events", "users", column: "manager_id"
  add_foreign_key "shift_change_plans", "departments"
  add_foreign_key "shift_change_plans", "users"
  add_foreign_key "shift_change_plans", "users", column: "created_by_id"
  add_foreign_key "shift_change_plans", "users", column: "updated_by_id"
  add_foreign_key "shift_count_shots", "areas"
  add_foreign_key "shift_daily_comments", "users"
  add_foreign_key "shift_daily_comments", "users", column: "created_by_id"
  add_foreign_key "shift_daily_comments", "users", column: "updated_by_id"
  add_foreign_key "shift_design_time_cards", "departments"
  add_foreign_key "shift_design_time_cards", "shift_design_time_records"
  add_foreign_key "shift_design_time_cards", "users", column: "created_by_id"
  add_foreign_key "shift_design_time_cards", "users", column: "updated_by_id"
  add_foreign_key "shift_design_time_records", "prospective_employees"
  add_foreign_key "shift_design_time_records", "users"
  add_foreign_key "shift_design_time_records", "users", column: "created_by_id"
  add_foreign_key "shift_design_time_records", "users", column: "updated_by_id"
  add_foreign_key "shift_dest_arrangement_details", "shift_dest_arrangements"
  add_foreign_key "shift_dest_arrangement_details", "users", column: "created_by_id"
  add_foreign_key "shift_dest_arrangement_details", "users", column: "updated_by_id"
  add_foreign_key "shift_dest_arrangements", "destinations"
  add_foreign_key "shift_dest_arrangements", "users", column: "created_by_id"
  add_foreign_key "shift_dest_arrangements", "users", column: "updated_by_id"
  add_foreign_key "shift_dest_designs", "destinations"
  add_foreign_key "shift_dest_designs", "users", column: "created_by_id"
  add_foreign_key "shift_dest_designs", "users", column: "updated_by_id"
  add_foreign_key "shift_dest_differences", "destinations"
  add_foreign_key "shift_dest_differences", "users", column: "created_by_id"
  add_foreign_key "shift_dest_differences", "users", column: "updated_by_id"
  add_foreign_key "shift_dest_plans", "destinations"
  add_foreign_key "shift_dest_plans", "users", column: "confirmed_by_id"
  add_foreign_key "shift_dest_plans", "users", column: "created_by_id"
  add_foreign_key "shift_dest_shots", "destinations"
  add_foreign_key "shift_dests", "destinations"
  add_foreign_key "shift_dests", "users", column: "created_by_id"
  add_foreign_key "shift_dests", "users", column: "updated_by_id"
  add_foreign_key "shift_haken_months", "kkbs"
  add_foreign_key "shift_haken_shops", "haken_shops"
  add_foreign_key "shift_haken_shops", "shift_hakens"
  add_foreign_key "shift_haken_users", "haken_shops"
  add_foreign_key "shift_haken_users", "shift_hakens"
  add_foreign_key "shift_haken_users", "users"
  add_foreign_key "shift_hakens", "kkbs"
  add_foreign_key "shift_hakens", "users"
  add_foreign_key "shift_holiday_helps", "destinations"
  add_foreign_key "shift_holiday_helps", "shift_users"
  add_foreign_key "shift_management_groups", "groups"
  add_foreign_key "shift_management_groups", "shift_managements"
  add_foreign_key "shift_management_members", "shift_managements"
  add_foreign_key "shift_management_members", "users"
  add_foreign_key "shift_managements", "areas"
  add_foreign_key "shift_managements", "regions"
  add_foreign_key "shift_managements", "shift_categories"
  add_foreign_key "shift_managements", "users", column: "updated_by_id"
  add_foreign_key "shift_operations", "users", column: "created_by_id"
  add_foreign_key "shift_priorities", "destinations"
  add_foreign_key "shift_priorities", "users"
  add_foreign_key "shift_proc_chain_nodes", "shift_proc_chain_nodes", column: "prev_node_id"
  add_foreign_key "shift_proc_chain_nodes", "shift_proc_chains"
  add_foreign_key "shift_proc_chain_nodes", "shift_users"
  add_foreign_key "shift_proc_chains", "shift_users"
  add_foreign_key "shift_proc_chains", "users", column: "confirmed_by_id"
  add_foreign_key "shift_proc_chains", "users", column: "created_by_id"
  add_foreign_key "shift_request_changes", "destinations"
  add_foreign_key "shift_request_changes", "shift_requests"
  add_foreign_key "shift_request_changes", "users"
  add_foreign_key "shift_request_dest_counts", "destinations"
  add_foreign_key "shift_request_dest_counts", "shift_requests"
  add_foreign_key "shift_request_dests", "shift_requests"
  add_foreign_key "shift_request_procs", "shift_requests"
  add_foreign_key "shift_request_users", "shift_requests"
  add_foreign_key "shift_request_users", "shift_users"
  add_foreign_key "shift_requests", "destinations"
  add_foreign_key "shift_requests", "regions"
  add_foreign_key "shift_requests", "users"
  add_foreign_key "shift_requests", "users", column: "approved_by_id"
  add_foreign_key "shift_requests", "users", column: "confirmed_by_id"
  add_foreign_key "shift_requests", "users", column: "created_by_id"
  add_foreign_key "shift_requests", "users", column: "declined_by_id"
  add_foreign_key "shift_requests", "users", column: "posted_by_id"
  add_foreign_key "shift_requests", "users", column: "updated_by_id"
  add_foreign_key "shift_reservations", "departments"
  add_foreign_key "shift_reservations", "users"
  add_foreign_key "shift_reservations", "users", column: "created_by_id"
  add_foreign_key "shift_reservations", "users", column: "updated_by_id"
  add_foreign_key "shift_sequence_users", "shift_sequences"
  add_foreign_key "shift_sequence_users", "shift_users"
  add_foreign_key "shift_sequences", "users", column: "created_by_id"
  add_foreign_key "shift_sequences", "users", column: "updated_by_id"
  add_foreign_key "shift_time_cards", "departments"
  add_foreign_key "shift_time_cards", "shift_users"
  add_foreign_key "shift_user_additions", "shift_users"
  add_foreign_key "shift_user_additions", "users", column: "created_by_id"
  add_foreign_key "shift_user_design_logs", "shift_user_designs"
  add_foreign_key "shift_user_design_logs", "users", column: "confirmed_by_id"
  add_foreign_key "shift_user_designs", "destinations"
  add_foreign_key "shift_user_designs", "users"
  add_foreign_key "shift_user_designs", "users", column: "created_by_id"
  add_foreign_key "shift_user_designs", "users", column: "updated_by_id"
  add_foreign_key "shift_user_holidays", "destinations"
  add_foreign_key "shift_user_holidays", "users"
  add_foreign_key "shift_user_permissions", "users"
  add_foreign_key "shift_user_permissions", "users", column: "created_by_id"
  add_foreign_key "shift_user_shots", "destinations"
  add_foreign_key "shift_user_shots", "users"
  add_foreign_key "shift_user_sups", "users"
  add_foreign_key "shift_user_sups", "users", column: "created_by_id"
  add_foreign_key "shift_users", "destinations"
  add_foreign_key "shift_users", "users"
  add_foreign_key "shift_users", "users", column: "confirmed_by_id"
  add_foreign_key "shift_users", "users", column: "created_by_id"
  add_foreign_key "shift_users", "users", column: "updated_by_id"
  add_foreign_key "shift_weekly_checks", "departments"
  add_foreign_key "shift_weekly_checks", "users", column: "created_by_id"
  add_foreign_key "shift_weekly_checks", "users", column: "updated_by_id"
  add_foreign_key "shift_weekly_comments", "users"
  add_foreign_key "shift_weekly_comments", "users", column: "created_by_id"
  add_foreign_key "shift_weekly_comments", "users", column: "updated_by_id"
  add_foreign_key "shop_experiences", "departments"
  add_foreign_key "shop_experiences", "users"
  add_foreign_key "shop_hours", "departments"
  add_foreign_key "shop_regular_times", "departments"
  add_foreign_key "shop_report_staffs", "shop_reports"
  add_foreign_key "shop_reports", "departments"
  add_foreign_key "shops", "companies"
  add_foreign_key "staff_agencies", "users", column: "created_by_id"
  add_foreign_key "staff_agencies", "users", column: "updated_by_id"
  add_foreign_key "staff_discounts", "staff_discount_types"
  add_foreign_key "staff_discounts", "users"
  add_foreign_key "staff_discounts", "users", column: "created_by_id"
  add_foreign_key "staff_discounts", "users", column: "updated_by_id"
  add_foreign_key "staff_summaries", "areas"
  add_foreign_key "stock_holders", "companies"
  add_foreign_key "stock_holders", "companies", column: "holder_company_id"
  add_foreign_key "stock_holders", "users", column: "holder_user_id"
  add_foreign_key "stock_holders", "users", column: "updated_by_id"
  add_foreign_key "strategic_human_resources", "users"
  add_foreign_key "strategic_human_resources", "users", column: "contact_user_id"
  add_foreign_key "strategic_human_resources", "users", column: "created_by_id"
  add_foreign_key "substitute_work_days", "shift_users", column: "change_shift_user_id"
  add_foreign_key "substitute_work_days", "shift_users", column: "substitute_shift_user_id"
  add_foreign_key "substitute_work_days", "users", column: "checker_id"
  add_foreign_key "substitute_work_days", "users", column: "created_by_id"
  add_foreign_key "supervisor_infos", "departments"
  add_foreign_key "supervisor_infos", "users"
  add_foreign_key "supervisor_infos", "users", column: "created_by_id"
  add_foreign_key "supervisor_infos", "users", column: "manager_id"
  add_foreign_key "suppliers", "users", column: "created_by_id"
  add_foreign_key "suppliers", "users", column: "updated_by_id"
  add_foreign_key "task_categories", "task_categories", column: "parent_id"
  add_foreign_key "task_categories", "users", column: "created_by_id"
  add_foreign_key "task_categories", "users", column: "updated_by_id"
  add_foreign_key "task_category_users", "task_categories"
  add_foreign_key "task_category_users", "users"
  add_foreign_key "task_meetings", "users", column: "created_by_id"
  add_foreign_key "task_meetings", "users", column: "updated_by_id"
  add_foreign_key "task_report_additions", "task_reports"
  add_foreign_key "task_report_timelines", "task_reports"
  add_foreign_key "task_reports", "kkbs"
  add_foreign_key "task_reports", "users"
  add_foreign_key "task_reports", "users", column: "created_by_id"
  add_foreign_key "task_reports", "users", column: "updated_by_id"
  add_foreign_key "task_target_users", "users"
  add_foreign_key "task_target_users", "users", column: "created_by_id"
  add_foreign_key "task_target_users", "users", column: "updated_by_id"
  add_foreign_key "task_users", "tasks"
  add_foreign_key "task_users", "users"
  add_foreign_key "tasks", "task_categories"
  add_foreign_key "tasks", "task_meetings"
  add_foreign_key "tasks", "users", column: "created_by_id"
  add_foreign_key "tasks", "users", column: "updated_by_id"
  add_foreign_key "time_card_generators", "departments"
  add_foreign_key "time_card_generators", "users"
  add_foreign_key "time_card_generators", "users", column: "created_by_id"
  add_foreign_key "time_card_generators", "users", column: "updated_by_id"
  add_foreign_key "time_cards", "departments"
  add_foreign_key "time_cards", "time_records"
  add_foreign_key "time_record_results", "time_records"
  add_foreign_key "time_record_summaries", "users"
  add_foreign_key "time_records", "users"
  add_foreign_key "time_records", "users", column: "edit_user_id"
  add_foreign_key "time_sheets", "departments", column: "department1_id"
  add_foreign_key "time_sheets", "departments", column: "department2_id"
  add_foreign_key "time_sheets", "departments", column: "department3_id"
  add_foreign_key "time_sheets", "departments", column: "department4_id"
  add_foreign_key "time_sheets", "departments", column: "department5_id"
  add_foreign_key "time_sheets", "users"
  add_foreign_key "time_sheets", "users", column: "edit_user_id"
  add_foreign_key "trn_capture_histories", "users", column: "created_by_id"
  add_foreign_key "trn_capture_records", "users", column: "created_by_id"
  add_foreign_key "trn_journal_entry_histories", "users", column: "created_by_id"
  add_foreign_key "trn_journal_entry_records", "users", column: "created_by_id"
  add_foreign_key "uniform_numbers", "users", column: "created_by_id"
  add_foreign_key "uniform_numbers", "users", column: "updated_by_id"
  add_foreign_key "unit_daily_reports", "kkbs"
  add_foreign_key "unit_daily_reports", "unit_report_items"
  add_foreign_key "unit_daily_reports", "users", column: "created_by_id"
  add_foreign_key "unit_daily_reports", "users", column: "updated_by_id"
  add_foreign_key "unit_report_items", "organization_units"
  add_foreign_key "unit_report_items", "users", column: "created_by_id"
  add_foreign_key "unit_report_items", "users", column: "updated_by_id"
  add_foreign_key "unit_tasks", "organization_units", column: "from_organization_unit_id"
  add_foreign_key "unit_tasks", "organization_units", column: "to_organization_unit_id"
  add_foreign_key "unit_tasks", "users", column: "created_by_id"
  add_foreign_key "unit_tasks", "users", column: "updated_by_id"
  add_foreign_key "user_additions", "users"
  add_foreign_key "user_areas_regions", "areas"
  add_foreign_key "user_areas_regions", "regions"
  add_foreign_key "user_block_values", "block_values"
  add_foreign_key "user_block_values", "users"
  add_foreign_key "user_certified_licenses", "users"
  add_foreign_key "user_code_generators", "companies"
  add_foreign_key "user_code_generators", "users", column: "updated_by_id"
  add_foreign_key "user_divisions", "users", column: "created_by_id"
  add_foreign_key "user_divisions", "users", column: "updated_by_id"
  add_foreign_key "user_families", "users"
  add_foreign_key "user_notifications", "users"
  add_foreign_key "user_notifications", "users", column: "created_by_id"
  add_foreign_key "user_regular_times", "users"
  add_foreign_key "user_relationships", "users"
  add_foreign_key "user_relationships", "users", column: "related_id"
  add_foreign_key "user_roles", "users", column: "created_by_id"
  add_foreign_key "user_roles", "users", column: "updated_by_id"
  add_foreign_key "user_roster_infos", "areas"
  add_foreign_key "user_roster_infos", "companies"
  add_foreign_key "user_roster_infos", "companies", column: "former_company_id"
  add_foreign_key "user_roster_infos", "departments"
  add_foreign_key "user_roster_infos", "deployments"
  add_foreign_key "user_roster_infos", "organization_units"
  add_foreign_key "user_roster_infos", "salary_types"
  add_foreign_key "user_roster_infos", "user_divisions"
  add_foreign_key "user_roster_infos", "user_roles"
  add_foreign_key "user_roster_infos", "user_segments"
  add_foreign_key "user_roster_infos", "users"
  add_foreign_key "user_roster_infos", "users", column: "ads_mediator_id"
  add_foreign_key "user_roster_infos", "users", column: "group_leader_id"
  add_foreign_key "user_roster_infos", "users", column: "manager_id"
  add_foreign_key "user_roster_infos", "users", column: "over_time_checker_id"
  add_foreign_key "user_roster_infos", "users", column: "shift_manager_id"
  add_foreign_key "user_segments", "users", column: "created_by_id"
  add_foreign_key "user_segments", "users", column: "updated_by_id"
  add_foreign_key "user_shift_blocks", "shift_blocks"
  add_foreign_key "user_shift_blocks", "users"
  add_foreign_key "user_start_times", "users"
  add_foreign_key "user_team_tags", "team_tags"
  add_foreign_key "user_team_tags", "users"
  add_foreign_key "user_uniform_numbers", "uniform_numbers"
  add_foreign_key "user_uniform_numbers", "users"
  add_foreign_key "users", "map_locations", column: "location_address_id"
  add_foreign_key "users", "map_locations", column: "location_station_id"
  add_foreign_key "users", "users", column: "parent_id"
  add_foreign_key "vehicle_costs", "users"
end
