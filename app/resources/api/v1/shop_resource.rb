module Api
  module V1
    class ShopResource < JSONAPI::Resource
      @shops = Shop.all.includes(:cards)
      attributes :name
      exclude_links [:self, :related]
      has_many :cards, exclude_links: [:self]
      has_many :users, through: :cards, exclude_links: [:self]
    end
  end
end
