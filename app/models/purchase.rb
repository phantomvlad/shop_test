class Purchase < ApplicationRecord
  validates :amount, comparison: { greater_than: 0, message: "must be greater than 0" }
  #validates :user_id, presence: { message: "is required" }
  #validates :shop_id, presence: { message: "is required" }
  validate :user_and_shop
  def user_and_shop
    unless Shop.where(id: shop_id).present?
      errors.add(:shop_id, "is required")
    end

    unless User.where(id: user_id).present?
      errors.add(:user_id, "is required")
    end
  end
end
