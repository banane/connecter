module Api
  module V1
    class PeopleController < ApplicationController
      respond_to :json

      def create
        respond_with Login.create(params[:email])
      end
    end
  end
end