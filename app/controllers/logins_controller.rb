class LoginsController < ApplicationController
  # "Create" a login, aka "log the user in"
  def create
    person = Person.where(:email => params[:email])
    if person.present?
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = person.id
      redirect_to root_url
    end
  end
end