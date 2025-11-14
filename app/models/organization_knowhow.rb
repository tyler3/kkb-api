class OrganizationKnowhow < ApplicationRecord
  belongs_to :organization_unit

  validates :title, presence: true
  validates :organization_unit_id, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
