class UsersController < ApplicationController
 def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])
    @shoe = Shoe.find_by_id(params[:user_id])

  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to "/users/#{@user.id}"
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
def user_params
  params.require(:user).permit(:name, :email, :address_line_1, :address_line_2, :city, :zip_code, :state, :password, :password_confirmation, :image)
end


end
