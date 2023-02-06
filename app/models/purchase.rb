class Purchase < ApplicationRecord
  validates :amount, comparison: { greater_than: 0, message: "is required" }
  validates :user_id, presence: { message: "is required" }
end
