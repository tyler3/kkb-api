class ShiftCategory < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i(code name rank hidden)

  has_many :shift_management, dependent: :destroy

  before_save :set_rank

  def set_rank
    self.rank = ShiftCategory.maximum(:rank).to_i + 1 if rank.nil?
  end
end