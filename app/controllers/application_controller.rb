class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    # is this working?
    @_current_user ||= session[:current_user_id] &&
        Person.find_by_id(session[:current_user_id])
  end
  def verify_token

    if params[:auth_token].present?
      @current_user = Person.find_by_authentication_token(params[:auth_token])
      @current_user.present?
    else
      false
    end
  end
end

