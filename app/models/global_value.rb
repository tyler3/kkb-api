class GlobalValue < ApplicationRecord
  def self.get_item(code, date=nil)
    if date.present?
      item = GlobalValue.where(code: code).where('applied_on <= ?', date).order(applied_on: :desc).first
    else
      item = GlobalValue.find_by(code: code, applied_on: nil)
    end
    item
  end
end
