module Api
  module V1
    class CardsController < ApiController
      before_action :table_name

      def index
        params_require_filer
        sum_bonuses
      end

      def show
        @card = Card.find(params[:id])
      end

      def table_name
        @table_name = "cards"
      end

      private

      def params_require_filer
        if params&.require(:stats)[:bonuses] == "sum"
          @flag_sum = true
        end

        if params.include?(:filter)
          if params.require(:filter).include?(:user_id)
            @data = Card.includes(:user).where(user_id: params.require(:filter)[:user_id])
          elsif params.require(:filter).include?(:shop_id)
            @data = Card.includes(:shop).where(shop_id: params.require(:filter)[:shop_id])
          else
            render json: { error: 'no filter' }
          end
        else
          @data = Card.includes(:user)
        end
      end

      def sum_bonuses
        @sum = 0
        @data.each do |card|
          @sum += card.bonuses
        end
        @sum
      end
    end
  end
end
