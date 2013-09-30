module Api
  module V1
    class LoginsController < BaseController
      respond_to :json

      def create

          person = Person.where(:email => params[:email]).first
          if person.present?
            # Save the user ID in the session so it can be used in
            # subsequent requests
            session[:current_user_id] = person.id
            successful_login(person)

          end
      end
    end
  end
end