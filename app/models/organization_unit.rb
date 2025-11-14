class OrganizationUnit < ApplicationRecord
  REGISTRABLE_ATTRIBUTES =
    %i(code name data_type parent_id manager_id row_number col_number has_folder sort_order hidden description start_on end_on symbol folder_url user_segment_id displayable)

  belongs_to :parent, class_name: "OrganizationUnit", foreign_key: :parent_id, optional: true
  belongs_to :manager, class_name: "User", foreign_key: :manager_id, optional: true
  belongs_to :user_segment, optional: true
  has_many :children, class_name: "OrganizationUnit", foreign_key: :parent_id, dependent: :destroy
  has_many :sent_tasks, class_name: 'UnitTask', foreign_key: 'from_organization_unit_id'
  has_many :received_tasks, class_name: 'UnitTask', foreign_key: 'to_organization_unit_id'
  has_many :organization_unit_users, dependent: :destroy
  has_many :users, through: :organization_unit_users
  has_many :business_divisions, dependent: :destroy
  has_many :organization_knowhows, dependent: :destroy
  has_one_attached :monthly_report_file
  has_one_attached :quick_report_file
  has_one_attached :flow_file
  
  accepts_nested_attributes_for :organization_unit_users, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }

  enum :data_type, { static: 1, dynamic: 2 }

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true

  # スコープ：非表示でない組織のみを取得
  scope :visible, -> { where(hidden: false) }

  def name_with_code
    "#{name}(#{code})"
  end
    
  def hierarchical_children(excepted_id=nil)
    units = []
    children.where(hidden: false).where.not(id: excepted_id).order(:sort_order).each do |child|
      units.push(child)
      units += child.hierarchical_children(excepted_id)
    end
    units
  end

  # 階層化された順に取得
  def self.hierarchical_all(excepted_id=nil)
    units = []
    OrganizationUnit.where(hidden: false, parent_id: nil).where.not(id: excepted_id).order(:sort_order).each do |child|
      units.push(child)
      units += child.hierarchical_children(excepted_id)
    end
    units
  end

  # 組織の階層レベルを取得（0が最上位）
  def hierarchy_level
    level = 0
    current = self
    while current.parent.present?
      level += 1
      current = current.parent
    end
    level
  end
end
