class KkbDest < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :kkb
end
