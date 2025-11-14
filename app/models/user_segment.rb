class UserSegment < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i(register _destroy id code name hidden)
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_id, optional: true
  belongs_to :updated_by, class_name: 'User', foreign_key: :updated_by_id, optional: true

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
end
