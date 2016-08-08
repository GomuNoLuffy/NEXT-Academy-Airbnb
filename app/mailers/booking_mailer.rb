class BookingMailer < ApplicationMailer
	def booking_email(customer, booking, listing)
		@customer = customer
		@host = User.find(listing.user_id)
		@url = "http://localhost:3000/bookings"
		mail(to: @customer.email, subject: 'A booking has been made')
	end
end
