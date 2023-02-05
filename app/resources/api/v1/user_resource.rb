module Api
  module V1
    class UserResource < JSONAPI::Resource
      @users = User.all.includes(:cards)
      attributes :email
      exclude_links [:self, :related]
      has_many :cards, exclude_links: [:self]
      has_many :shops, through: :cards, exclude_links: [:self]
    end
  end
end



