class ShiftManagementGroup < ApplicationRecord
  belongs_to :shift_management
  belongs_to :group
end
