class GroupRegion < ApplicationRecord
  belongs_to :group
  belongs_to :region

  enum :proc_type, { time_record: 1 }
end
