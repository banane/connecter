module Api
  module V1
    class PeopleController < BaseController
      respond_to :json, :html
      def index
        @people = Person.where(:attending => true).includes(:followed_people)
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

      def index_follows_me
        @followsme = FollowedPerson.where(:followed_person_id => current_user.id)
        respond_with @followsme
      end

    end
  end
end