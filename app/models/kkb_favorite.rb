class KkbFavorite < ApplicationRecord
  belongs_to :kkb
  belongs_to :user

  validates :kkb, presence: true
  validates :user, presence: true
end
