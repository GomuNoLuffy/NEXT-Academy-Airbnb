class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	belongs_to :payments
	validate :check_overlapping_bookings
	validate :valid_date # prevent booking date before today
	validate :num_guests

	def check_overlapping_bookings
	
		unavailable_dates = listing.available_dates.pluck(:date)
		dates_to_book = (start_date..end_date).to_a
		non_overlapping_dates = dates_to_book - unavailable_dates
		if dates_to_book == non_overlapping_dates
			return
		else
			errors.add(:overlapping_dates, "dates are not available")
		end
	end

	def valid_date
		if start_date > DateTime.now and end_date > start_date
			return
		else
			errors.add(:invalid_dates, "dates are invalid")
		end
	end

	def num_guests
		if num_guest > 0 and num_guest <= listing.max_guests
			return
		else
			errors.add(:invalid_num_guest, "number of guests is out of range")
		end
	end
end
