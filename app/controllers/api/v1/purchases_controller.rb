module Api
  module V1
    class PurchasesController < ApiController
      def buy
        @purchase = Purchase.create(purchase_params)

        if @purchase.save
          @card = Card.where(shop_id: @purchase.shop_id, user_id: @purchase.user_id).first
          bonus_program
        else
          respond_with_errors(@user, "422")
        end
      end

      private

      def purchase_params
        params.permit(:amount, :use_bonuses, :user_id, :shop_id)
      end

      def bonus_program
        if @purchase.use_bonuses
          all_cards_user = Card.where(user_id: @purchase.user_id)
          sum_bonuses_user = 0
          all_cards_user.each do |card|
            sum_bonuses_user += card.bonuses
          end

          if (User.find(@purchase.user_id).negative_balance && ((sum_bonuses_user - @purchase.amount.ceil) >= 0)) ||
            (User.find(@purchase.user_id).negative_balance == false && @purchase.amount.ceil <= @card.bonuses )
            @card.update(bonuses: @card.bonuses - @purchase.amount.ceil)
            @amount_due = 0
          else
            @amount_due = @purchase.amount - sum_bonuses_user
            @card.update(bonuses: @card.bonuses - sum_bonuses_user)
          end

        else
          @card.update(bonuses: @card.bonuses + (@purchase.amount*0.01).floor) if @purchase.amount >= 100
          @amount_due = @purchase.amount
        end
      end
    end
  end
end
