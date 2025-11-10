class Area < ApplicationRecord
  has_and_belongs_to_many :regions

  scope :active, -> { where(hidden: false) }

  def smallest_region
    min_area_size = regions.map { |region| region.areas.size }.min
    regions.find { |region| region.areas.size == min_area_size }
  end

end
