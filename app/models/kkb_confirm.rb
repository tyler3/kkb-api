class KkbConfirm < ApplicationRecord
  belongs_to :user
  belongs_to :kkb
  enum :status, {unread: 0, read: 1, unconfirmed: 3, unrelated: 4}

  def self.time_limit_now
    date = Date.today + 1
    Time.new(date.year, date.month, date.day, 12, 0)
  end
end
