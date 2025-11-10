class KkbMember < ApplicationRecord
  belongs_to :user
  belongs_to :kkb
  enum :member_type, {hidden: 0, reader: 1, charge: 2, chief: 3, hidden_super: 4} #, default: :reader # chief 完了者（責任者）
end
