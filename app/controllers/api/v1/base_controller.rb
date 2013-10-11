module Api
  module V1
    class BaseController < ApplicationController
      respond_to :json, :html

      #:verify_authenticity_token


      def error!(http_status_code, error_hash)
        render :json => error_hash.to_json, :status => http_status_code
      end

      def not_found!
        error!(404, error_hash('not_found'))
      end


      def invalid_data!
        error!(400, error_hash('invalid_data'))
      end


      def error_hash(code, message = nil)
        error_hash = {}
        error_hash[:error_code] = code
        error_hash[:error_message] = message if message.present?
        error_hash
      end


      def successful_login(person)

        render :json => {
            :success    => true,
            :person     => person,
            :status     => 200,
            :auth_token => person.authentication_token
        }
      end

      def api_invalid_login
        render :json => {:success => false, :reason => t(:invalid, :scope => [:devise, :failure])}, :status => 401
      end
    end
  end
end
