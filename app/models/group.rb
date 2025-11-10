class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_regions, dependent: :destroy
  has_many :regions, through: :group_regions
  belongs_to :user, optional: true
  belongs_to :created_by, class_name: "User", foreign_key: :created_by_id, optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: :updated_by_id, optional: true

  def member?(user)
    group_users.where(user_id: user&.id).present?
  end

  def member_id?(user_id)
    group_users.where(user_id: user_id).present?
  end
end
