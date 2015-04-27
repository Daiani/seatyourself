class RestaurantsController < ApplicationController

  def index
  	@restaurants = Restaurant.all
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def new
  	@restaurants = Restaurant.new
  end

  def create
  	@restaurants = Restaurant.new(restaurants_params)

  	if @restaurants.save
  		redirect_to restaurants_url
  	else
  		render :new
  	end
  end
  
  private
  def restaurants_params
  	params.require(:restaurant).permit(:name, :category, :price_range, :address, :opening_time, :closing_time, :capacity)

  end
end



