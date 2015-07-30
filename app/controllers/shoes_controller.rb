class ShoesController < ApplicationController
  before_action :authenticate
  before_action :authorize

  def index
    @shoes = Shoe.all
  end
  def new
    @shoe = Shoe.new
  end

  def create
    shoe = Shoe.new(shoe_params)
    if shoe.save
      current_user.shoes << shoe
      redirect_to current_user, notice: "New Shoe Added!"
    else
      render 'new'
    end
  end

  def show
    @shoe = Shoe.find(params[:id])
    @user = current_user
    @initial = HTTParty.get("http://open.api.ebay.com/shopping?callname=FindPopularItems&appid=JayteeSa-3433-4a58-83be-4f7587f2eae9&version=517&siteid=0&QueryKeywords=Jordan7GMP&responseencoding=JSON")
    @shoes = @initial
  end

  def edit
    @shoe = Shoe.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
    unless current_user.id == @shoe.user_id
      flash.now.alert ="You can't edit Shoes that aren't yours"
    end

  end

  def update
    @user = User.find_by_id(params[:id])
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

    unless current_user != @shoe
      flash.now.alert =
        "You are not authorized to edit this Shoe's information."
      redirect_to user_path(@user)
    end
  end

  def shoe_params
    params.require(:shoe).permit(:name, :condition, :asking_price, :image)
  end
end
