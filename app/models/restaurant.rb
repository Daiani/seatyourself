class Restaurant < ActiveRecord::Base

has_many :reservations
has_many :users, through: :reservations

validates :name, presence: true, length: { maximum: 40 }
validates :opening_hour, :closing_hour, :capacity, presence: true
#   def full?(datetime, requested_party_size)
#   	seats_left(datetime) <= requested_party_size
# end

	private

	# def seats_left(datetime)
	# 	  self.capacity - seats_taken(datetime) 

	# end

	def seats_taken(datetime)

		people_in_seats = 0


		reservations_at_this_timeslot(datetime).each do |reservation|
					people_in_seats += reservation.party_size
				end


		    people_in_seats
		  end

	
		  def reservations_at_this_timeslot(datetime)
		  	self.reservations.where(datetime: datetime)
		  end
end


