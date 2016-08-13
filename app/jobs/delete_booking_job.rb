class DeleteBookingJob < ActiveJob::Base
  queue_as :default

  def perform(booking, listing)
    @listing = listing
    if Payment.find_by(booking_id: booking.id) == nil
    	date_range = booking.start_date.to_date..booking.end_date.to_date
			date_range.each do |date|
			AvailableDate.find_by(listing_id: @listing.id, date: date).destroy
			end
    	booking.destroy
    end
  end
end
