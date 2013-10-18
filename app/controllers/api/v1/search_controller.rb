module Api
  module V1
    class SearchController < BaseController
      before_filter :verify_token
      respond_to :json, :html

      def index
      end

      def create
         @search = search(params)
         @query = params[:query]
      end

      protected
      def search(options)

        Sunspot.search(Person) do

         # keywords options[:query]
          fulltext options[:query]
        #  paginate :page => options[:page]
        end
      end
    end
  end
end