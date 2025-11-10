class ShiftManagementMember < ApplicationRecord
  belongs_to :user
  belongs_to :shift_management
end
