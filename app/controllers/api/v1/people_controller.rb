module Api
  module V1
    class PeopleController < BaseController
# just can't get devise to acknolwedge token
#      before_filter :verify_authenticity_token
#      before_filter :authenticate_user!
# wrote custom
      before_filter :verify_token
      respond_to :json, :html


      def index
        @people = Person.all_attending.reject{ |p| p.id.eql?(@current_user.id) } # only have current user in controller
        @page = :attending

        respond_with @people
      end

      def show
        @person = Person.find(params[:id])
        respond_with @person
      end

      def create
        respond_with Person.create(params[:person])
      end

      def update
        Person.update(params[:id], params[:person])

        @person = Person.find(params[:id])
        flash[:notice] = "Profile successfully updated" if @person.valid?
        respond_with(@person) do |format|
          format.html { redirect_to edit_api_v1_person_path(:id => @person.id, :auth_token => @person.authentication_token) }
          format.json { render inline: @person.to_json }
        end
      end

      def index_follows_me
        @page = :followers
        @followsme = FollowedPerson.where(:followed_person_id => current_user.id)
        respond_with @followsme
      end

      def edit
        @person = Person.find(params[:id])
        respond_with @person
      end



    end
  end
end