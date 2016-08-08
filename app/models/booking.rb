class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	validate :check_overlapping_bookings
	validate :validate_date # prevent booking date before today

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

	def validate_date
		if start_date > DateTime.now and end_date > start_date
			return
		else
			errors.add(:invalid_dates, "dates are invalid")
		end

	end
end
