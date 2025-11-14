class OrganizationUnitUser < ApplicationRecord
  belongs_to :organization_unit
  belongs_to :user
  belongs_to :position, optional: true
  
  validates :organization_unit_id, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :organization_unit_id }
  
  scope :with_position, -> { includes(:position) }
  scope :by_position_class, ->(clazz) { joins(:position).where(positions: { position_class: clazz }) }
  
  def position_name
    position&.name || position
  end
  
  def position_class_text
    position&.position_class_text || '未設定'
  end
  
  def salary_base
    position&.salary_base || 400
  end
end
