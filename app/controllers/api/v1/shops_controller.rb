module Api
  module V1
    class ShopsController < ApiController
      before_action :table_name
      def index
        params_require_filer
      end

      def show
        @shop = Shop.find(params[:id])
      end

      def create
        @shop = Shop.create(shop_params[:attributes])

        if @shop.save
          render "api/v1/shops/show"
        else
          respond_with_errors(@shop, "422")
        end
      end

      def update
        @shop = Shop.find(shop_params[:id])
        if @shop.update(shop_params[:attributes])
          render "api/v1/shops/show"
        else
          respond_with_errors(@shop, "422")
        end
      end

      private

      def table_name
        @table_name = "shops"
      end

      def shop_params
        params.require(:data).permit(:id, :type, {attributes: [:name]} )
      end

      def params_require_filer
        if params.include?(:filter)
          if params.require(:filter).include?(:user_id)
            @data = Shop.includes(:cards).where(cards: Card.includes(:user).where(user_id: params.require(:filter)[:user_id]))
          else
            render json: { error: 'no filter' }
          end
        else
          @data = Shop.includes(:users)
        end
      end
    end
  end
end
