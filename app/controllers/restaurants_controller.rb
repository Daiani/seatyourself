class RestaurantsController < ApplicationController

  def index
  	@restaurants = Restaurant.all
  end

  def show                                                      
  	@restaurant = Restaurant.find(params[:id])
    @reservation = Reservation.new
  end

  def new
  	@restaurants = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
  	@restaurants = Restaurant.new(restaurants_params)

  	if @restaurants.save
  		redirect_to restaurants_url
  	else
  		render :new
  	end
  end

   def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurants_params)
      redirect_to restaurants_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    @restaurant.reservations.each do |variable|
      variable.reservation.destroy
    end
    redirect_to restaurants_path
  end
  
  private
  def restaurants_params
  	params.require(:restaurant).permit(:name, :category, :price_range, :address, :opening_hour, :closing_hour, :capacity)

  end
end



