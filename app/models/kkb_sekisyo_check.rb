class KkbSekisyoCheck < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :kkb
  belongs_to :resource, polymorphic: true
  enum :status, { unchecked: 0, checked: 1, denied: 2 }

  def checkable?(user)
    unchecked? && user.sekisyo? && (user_id.nil? || user_id == user.id)
  end
end
