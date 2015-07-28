class ShoesController < ApplicationController
  before_action :authenticate, :authorize

  def index
    @shoes = Shoe.all
  end
  def new
    @shoe = Shoe.new
  end

  def create
    shoe = Shoe.new(shoe_params)
    shoe[:user_id] = user.id
    @user.shoes << shoe
    if shoe.save
      # current_user.cars << @car
      redirect_to user_path(@user), notice: "New Shoe Added!"
    else
      render 'new'
    end
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def edit
    @shoe = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
    if @shoe.update_attributes(shoe_params)
      redirect_to "/shoes/#{@shoe.id}"
    else
      render 'edit'
    end
  end

  def destroy
     shoe = Shoe.find(params[:id])
     if shoe.destroy
      redirect_to root_path, notice: "Shoe Removed!"
     else
      flash.now.alert ="Error trying to delete Shoe."
      redirect_to root_path
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
    @user = User.find_by_id(params[:id])

    unless current_user.user == @user
      flash.now.alert =
        "You are not authorized to edit this Shoe's information."
      redirect_to login_path
    end
  end

  def shoe_params
    params.require(:shoe).permit(:name, :condition, :asking_price, :image, :user_id)
  end
end
