class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(car_params)
    if @shoe.save
      # current_user.cars << @car
      redirect_to "/shoes/#{@shoe.id}"
    else
      render 'new'
    end
  end

  def show
    @shoe = Shoe.find_by_id(params[:id])
  end

  def edit
    @shoe = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
    if @shoe.update_attributes(car_params)
      redirect_to "/shoes/#{@shoe.id}"
    else
      render 'edit'
    end
  end

  def destroy
     @shoe = Shoe.find(params[:id])
     if @shoe.delete
      redirect_to show_path
    end
 end

  private

  def car_params
    params.require(:shoe).permit(:name, :condition, :asking_price, :image)
  end

end
