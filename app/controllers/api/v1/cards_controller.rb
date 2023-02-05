module Api
  module V1
    class CardsController < ApiController
      belongs_to :user
    end
  end
end
