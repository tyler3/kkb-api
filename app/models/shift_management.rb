class ShiftManagement < ApplicationRecord
  belongs_to :area, optional: true
  belongs_to :region, optional: true
  belongs_to :shift_category, optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: :updated_by_id
  attribute :excel_type, :integer
  enum :status, {untreated: 0, complete: 1, finished: 2, temporary: 9}
  enum :excel_type, {daily: 0, category: 1, daily_action: 2, created_at: 3, directions: 4, answers: 5}
  enum :table_type, {table_a: 0, table_b: 1, table_c: 2, table_d: 3, table_e: 4}
  has_many :shift_management_members, dependent: :destroy
  has_many :shift_management_groups, dependent: :destroy
end