class PaymentsController < ApplicationController
	
	def new
		gon.client_token = generate_client_token
	end


	private
	def total_price
		price_per_night = @listing.price
		num_days = (@booking.start_date..@booking.end_date).count
		return price_per_night * num_days
	end

	def set_listing
		@booking = Booking.find(params[:booking_id])
		@listing = @booking.listing
	end

	def generate_client_token
  	Braintree::ClientToken.generate
	end

end
