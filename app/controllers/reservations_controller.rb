class ReservationsController < ApplicationController
	before_filter :load_restaurant, except: [:index]

	def index

		@reservations = Reservation.all

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
			# current_user.add_points(@reservation.points)
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
			params[:reservation][:date].to_date.month,
			params[:reservation][:date].to_date.day,			
			params[:reservation][:date].to_time.hour,
			)
	end

def load_restaurant
	@restaurant = Restaurant.find(params[:restaurant_id])
end


end
