module Api
  module V1
    class PurchasesController < ApiController
      def buy
        @purchase = Purchase.create(purchase_params)

        if @purchase.save
          @card = Card.where(shop_id: @purchase.shop_id, user_id: @purchase.user_id).first
          if @purchase.use_bonuses
            @card.update(bonuses: @card.bonuses - @purchase.amount)
          else
            @card.update(bonuses: @card.bonuses + @purchase.amount)
          end
        else
          respond_with_errors(@user, "422")
        end
      end

      private

      def purchase_params
        params.permit(:amount, :use_bonuses, :user_id, :shop_id)
      end
    end
  end
end
