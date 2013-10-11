class Api::V1::TokensController  < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json
  def create
    email = params[:email]
   # password = params[:password]
    if request.format != :json
      render :status=>406, :json=>{:message=>"The request must be json"}
      return
    end

    if email.nil? #or password.nil?
      render :status=>400,
             :json=>{:message=>"The request must contain an email address."}
      return
    end

    @user=Person.find_by_email(email.downcase)

    if @user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      render :status=>401, :json=>{:message=>"Invalid email."}
      return
    end

    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    @user.ensure_authentication_token!
#
#    if not @user.valid_password?(password)
#      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
#      render :status=>401, :json=>{:message=>"Invalid email or password."}
#    else
      render :status=>200, :json=>{:token=>@user.authentication_token, :id => @user.id,
      :first_name => @user.first_name, :profile_photo => @user.profile_photo, :success => true}
   # end
  end

  def destroy
    @person=Person.find_by_authentication_token(params[:id])
    if @person.nil?
      logger.info("Token not found.")
      render :status=>404, :json=>{:message=>'Invalid token.'}
    else
      @person.reset_authentication_token!
      render :status=>200, :json=>{:token=>params[:id]}
    end
  end

end