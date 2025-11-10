class Region < ApplicationRecord
  has_and_belongs_to_many :areas
  has_many :group_regions, dependent: :destroy
  has_many :groups, through: :group_regions

  has_many :user_areas_regions
  has_many :user_areas, through: :user_areas_regions, source: :area

  validates :code, presence: true
  validates :name, presence: true

  before_save :set_rank

  default_scope { order(:rank) }
  scope :active, -> { where(hidden: false) }

  def set_rank
    self.rank = Region.maximum(:rank).to_i + 1 if rank.nil?
  end
end
