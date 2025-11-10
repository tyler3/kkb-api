class KkbGroup < ApplicationRecord
  belongs_to :kkb
  belongs_to :group
  enum :member_type, {reader: 1, charge: 2} #, default: :reader
end
