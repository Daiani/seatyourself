class ReservationsController < ApplicationController
	before_filter :load_restaurant

	def index

		@reservations = Reservation.where(restaurant_id: @restaurant.id, datetime: (DateTime.now)..(DateTime.now + 7)

	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(
			party_size: params[:reservation][:party_size],
			datetime: parsed_datetime,
			restaurant_id: params[:restaurant_id],
			user_id: current_user.id
			)

		if @reservation.save
			current_user.add_points(@reservation.points)
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def destroy
	end

	def edit
	end

	private

	def parsed_datetime
		DateTime.civil_from_format(
			:local,
			params[:reservation][:date].to_date.year,
<<<<<<< HEAD
			params[:reservation][:date].to_date.month
			params[:reservation][:date].to_date.day
=======
			params[:reservation][:date].to_date.month,
			params[:reservation][:date].to_date.day,
>>>>>>> 4b2eb1d3d07f7b93cdffd4ac188e5857734d98fa
			params[:reservation][:date].to_time.hour,
			00
			)
	end

def load_restaurant
	@restaurant = Restaurant.find(params[:restaurant_id])
end


end
