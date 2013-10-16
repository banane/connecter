module Api
  module V1
    class LoginsController < BaseController
      respond_to :json

      def index

      end

      def event_info
        respond_to do |format|
          format.json { render :json => { :link =>  "https://w2-lv-conference-2013.eventbrite.com/" } }
        end
      end
    end
  end
end