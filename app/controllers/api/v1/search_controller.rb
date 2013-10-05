class SearchController < ApplicationController
  def index
  end

  def create
     @search = search(params)
  end

  protected
  def search(options)
    Sunspot.search(Person) do
      keywords options[:query]
      paginate :page => options[:page]
    end
  end
end