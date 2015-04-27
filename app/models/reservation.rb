class Reservation < ActiveRecord::Base
	attr_accessor :date, :time

	belongs_to :user
	belongs_to :restaurant

	validates :user_id, :restaurant_id,
				presence: true

	validates :party_size,
				inclusion: { in: 2..20, message: "No more than 20, please!"}

	validate :restaurant_open, :restaurant_not_full, :in_the_future, :on_the_hour

	def formatted_time

			self.datetime.strftime("%A, %m/%d at %I:%M %p")
	end

	def points
				self.points_multiplier * self.party_size
	end
	
	private

			def restaurant_open
					if (self.datetime.hour < self.restaurant.opening_hour || self.datetime.hour > self.restaurant.closing_hour)
									errors.add(:datetime, "Our hours are 11am to 8pm.")
					end
			end

			def in_the_future
					if self.datetime < DateTime.now
							errors.add(:datetime, "Time machine required")
					end
			end

			def on_the_hour
						if self.datetime.minute != 00
							errors.add(:datetime, "Only on the hour")
						end
			end

			def restaurant_not_full
					if self.restaurant.full?(self.datetime, self.party_size)
									errors.add(:datetime, "We're full at that time.")
					end
			end	
end