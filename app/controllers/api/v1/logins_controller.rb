module Api
  module V1
    class LoginsController < BaseController
      respond_to :json

      def create
        redirect_to api_v1_tokens_create(params)
      end
      def index

      end
    end
  end
end