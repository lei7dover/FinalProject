class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :set_user, only: [:show, :edit, :update]

  def index
    @users=User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to root_url
    else
      render :action => :new

    end
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user = @current_user
  end

  def update
  @user = @current_user
    respond_to do |format|
       if @user.update(user_params)
         format.html { redirect_to root_path, notice: 'User was successfully updated.' }
       else
         format.html { redirect_to root_path }
       end
     end
  end

  private

   def set_user
     @user=User.find(params[:id])
   end

   def user_params
     params.require(:user).permit(:email,:name, :password, :password_confirmation)
   end
end
