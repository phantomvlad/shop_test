class Purchase < ApplicationRecord
  validates :amount, presence: true
  validates :user_id, presence: true
end
