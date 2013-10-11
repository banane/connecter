class Api::V1::FollowedPeopleController < ApplicationController
  before_filter :verify_token

  def create
    @followship = @current_user.followed_people.build(:person_id => @current_user.id,
    :followed_person_id => params[:person_id])
    if @followship.save
      flash[:notice] = "Followed."
      redirect_to api_v1_people_path(:auth_token=>@current_user.authentication_token)
    else
      flash[:error] = "Unable to follow."
      redirect_to api_v1_people_path(:auth_token=>@current_user.authentication_token)
    end
  end

  def destroy
    @followship = @current_user.followed_people.find(params[:id])
    @followship.destroy
    flash[:notice] = "No longer following."
    redirect_to api_v1_people_path(:auth_token=>@current_user.authentication_token)
  end

  def index
    @page = :following
    @follows = FollowedPerson.where(:person_id => @current_user.id).includes(:person)
  end

  def follows_me
    @page = :followers
    @followsme = FollowedPerson.where(:followed_person_id => @current_user.id).includes(:person)
  end
end