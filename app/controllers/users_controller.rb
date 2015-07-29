class UsersController < ApplicationController
  skip_before_action :authenticate, :except => [:new, :create]

 def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])

  end

  def edit
    @user = User.find_by_id(params[:id])
    unless current_user == @user
       flash.now.alert =
        "You can't edit someone else's profile!"
      redirect_to user_path
    end
  end

  def update
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

  def user_params
    params.require(:user).permit(:name, :email, :address_line_1, :address_line_2, :city, :zip_code, :state, :password, :password_confirmation, :image)
  end

end
