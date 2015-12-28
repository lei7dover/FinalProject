class UserSessionsController < ApplicationController
  before_action :require_user, only:[:destroy]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:alert]= "Login Sucessful!"
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:alert] = "Logout successful!"
    redirect_to organizations_path
  end

end
