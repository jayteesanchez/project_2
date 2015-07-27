class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all
  end

  def new
    @shoe = Shoe.new
    @user = current_user
  end

  def create
    @user = User.find(params[:id])
    @shoe = Shoe.new(shoe_params)
    @user.shoes << @shoe
    if @shoe.save
      # current_user.cars << @car
      redirect_to "users/user_id/shoes/#{@shoe.id}"
    else
      render 'new'
    end
  end

  def show
    @shoe = Shoe.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
  end

  def edit
    @shoe = Shoe.find(params[:id])
    @user = Shoe.find(params[:user_id])
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
     @shoe = Shoe.find(params[:id])
     if @shoe.delete
      redirect_to root_path
    end
 end

  private

  def shoe_params
    params.require(:shoe).permit(:name, :condition, :asking_price, :image)
  end

end
