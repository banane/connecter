class Api::V1::FollowedPeopleController < ApplicationController
  before_filter :verify_token

  def create
    @followship = @current_user.followed_people.build(:person_id => @current_user.id,
    :followed_person_id => params[:person_id])
    if @followship.save

      if params[:follow_page_return].eql?("show")
        redirect_to api_v1_person_path(:id => params[:person_id],  :auth_token=>@current_user.authentication_token,
        :from_view => params[:from_view] )
      elsif params[:from_view].eql?("following")
        redirect_to api_v1_followed_people_path(:auth_token=>@current_user.authentication_token)
      elsif params[:from_view].eql?("followers")
        redirect_to follows_me_api_v1_followed_people_path(:auth_token=>@current_user.authentication_token)
      elsif params[:from_view].eql?("show")
        redirect_to api_v1_person_path(:id => params[:person_id],  :auth_token=>@current_user.authentication_token)
      elsif params[:from_view].eql?("search")
        redirect_to return_create_api_v1_search_index_path(:query => params[:query],
        :auth_token=>@current_user.authentication_token)
#        redirect_to :back
      else
        redirect_to api_v1_people_path(:auth_token=>@current_user.authentication_token)
      end
    else
      flash[:error] = "Unable to follow."
      redirect_to api_v1_people_path(:auth_token=>@current_user.authentication_token)
    end
  end

  def destroy
    @followship = @current_user.followed_people.find(params[:id])
    followed_person = @followship.followed_person
    @followship.destroy
    flash[:notice] = "No longer following."

    if params[:follow_page_return].eql?("show")
      redirect_to api_v1_person_path(:id => followed_person.id,  :auth_token=>@current_user.authentication_token,
                                     :from_view => params[:from_view] )
    elsif params[:from_view].eql?("following")
      redirect_to api_v1_followed_people_path(:auth_token=>@current_user.authentication_token)
    elsif params[:from_view].eql?("followers")
      redirect_to follows_me_api_v1_followed_people_path(:auth_token=>@current_user.authentication_token)
    elsif params[:from_view].eql?("show")
      redirect_to api_v1_person_path(:id => followed_person.id,  :auth_token=>@current_user.authentication_token)
    elsif params[:from_view].eql?("search")
      redirect_to return_create_api_v1_search_index_path(:query => params[:query],
                                                         :auth_token=>@current_user.authentication_token)
    else
      redirect_to api_v1_people_path(:auth_token=>@current_user.authentication_token)
    end
  end

  def index
    @page = :following # deprecated
    @from_view = "following"
    @follows = FollowedPerson.includes(:person).where('people.attending=1 and followed_people.person_id = ?',
    @current_user.id).order('followed_people.created_at DESC').uniq
  end

  def follows_me
    @page = :followers # deprecated
    @from_view = "followers"
    @followsme = FollowedPerson.where('followed_people.followed_person_id = ? and people.attending = 1',@current_user.id).order('followed_people.created_at DESC').includes(:person).uniq
  end
end