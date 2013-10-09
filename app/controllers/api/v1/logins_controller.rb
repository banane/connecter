module Api
  module V1
    class LoginsController < BaseController
      respond_to :json

      def create

          person = Person.where(:email => params[:email]).first
          if person.present?
            session[:current_user_id] = person.id
            successful_login(person)
          else
            api_invalid_login
          end
      end
      def index

      end
    end
  end
end