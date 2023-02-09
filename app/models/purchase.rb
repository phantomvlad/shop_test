class Purchase < ApplicationRecord
  validates :amount, presence: { message: "is required" }
  #validates :user_id, presence: { message: "is required" }
  #validates :shop_id, presence: { message: "is required" }
  validate :user_and_shop
  validate :not_null
  def user_and_shop
    unless Shop.where(id: shop_id).present?
      errors.add(:shop_id, "is required")
    end

    unless User.where(id: user_id).present?
      errors.add(:user_id, "is required")
    end
  end

  def not_null
    if amount != nil && amount <= 0
      errors.add(:amount, 'must be greater than 0')
    end
  end
end
