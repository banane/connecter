module Api
  module V1
    class PeopleController < BaseController
      respond_to :json, :html
      def index
        @people = Person.where(:attending => true)
        respond_with @people
      end

      def show
        respond_with Person.find(params[:id])
      end

      def create
        respond_with Person.create(params[:person])
      end

      def update
        respond_with Person.update(params[:id], params[:person])
      end

    end
  end
end