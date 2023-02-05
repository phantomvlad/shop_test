class User < ApplicationRecord
  has_many :cards
  has_many :shops, through: :cards
  has_many :purchases

  validates_associated :cards, uniqueness: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
end
