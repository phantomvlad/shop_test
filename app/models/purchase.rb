class Purchase < ApplicationRecord
  validates :amount, comparison: { greater_than: 0, message: "is required" }
  validates :user_id, presence: { message: "is required" }
  validates :shop_id, presence: { message: "is required" }
  validate :user_and_shop
  def user_and_shop
    unless Shop.where(id: shop_id).present?
      errors.add(:shop_id, "not found")
    end

    unless User.where(id: user_id).present?
      errors.add(:user_id, "not found")
    end
  end


end
