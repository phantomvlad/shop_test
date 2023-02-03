module Api
  module V1
    class ApiController < ActionController::API
      before_action :set_json_format

      private

      def set_json_format
        request.format = :json
      end
    end
  end
end
