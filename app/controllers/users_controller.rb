class UsersController < ApplicationController
skip_before_action :require_login, only: [:new, :create]

 def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

private
  def authenticate
    unless logged_in?
      flash.now.alert =
        "You must be logged in to access this section of the site."
      redirect_to login_path
    end
  end

  def authorize
    @user = User.find(params[:user_id])

    unless current_user.user == @user
      flash.now.alert =
        "You are not authorized to edit this Shoe's information."
      redirect_to user_path(@user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :address_line_1, :address_line_2, :city, :zip_code, :state, :password, :password_confirmation, :image)
  end

end
