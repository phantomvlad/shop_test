module Api
  module V1
    class CardResource < JSONAPI::Resource
      attributes :bonuses
      exclude_links [:self, :related]
      belongs_to :user, exclude_links: [:self]
      belongs_to :shop, exclude_links: [:self]
    end
  end
end

