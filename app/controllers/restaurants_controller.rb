class RestaurantsController < ApplicationController
  def index
  	   @restaurants = Restaurant.all
  end

  def

  def show
  	   @restaurants = Restaurant.find(params[:id])
  end

  def new
  	@restaurants = Restaurants.new
  end

  def create
  	@restaurants = Restaurants.new(restaurants_params)

  	if @restaurants.save
  		redirect_to restaurants_url
  	else
  		render :new

  	end

  end
  private
  def restaurants_params
  	params.require(:name).permit(:name, :category, :price_range, :address)

  end
end





