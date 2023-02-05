require 'open-uri'

module Api
  module V1
    class UsersController < ApiController
      before_action :table_name

      def index
        @data = User.all
      end

      def show
        @user = User.find(params[:id])
      end

      def create
        @user = User.create(user_params_create)

        if @user.save
          render "api/v1/users/show"
        else
          respond_with_errors(@user, "422")
        end
      end

      def update
        @user = User.find(user_params_update[:id])
        if @user.update(user_params_update[:attributes])
          render "api/v1/users/show"
        else
          respond_with_errors(@user, "422")
        end
      end

      private

      def table_name
        @table_name = "users"
      end

      def user_params_create
        params.require(:data)[:attributes].permit([:email])
      end

      def user_params_update
        params.require(:data).permit(:id, :type, {attributes: [ :email, :negative_balance]} )
      end
    end
  end
end

