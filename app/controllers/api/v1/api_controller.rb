module Api
  module V1
    class ApiController < ApplicationController
      private

      def respond_with_errors(object, status_code)
        @object = object
        @status_code = status_code
        render 'error'
      end
    end
  end
end
