class Shop < ApplicationRecord
  has_many :cards
  has_many :users, through: :cards
  has_many :purchases

  validates_associated :cards, uniqueness: true
end
