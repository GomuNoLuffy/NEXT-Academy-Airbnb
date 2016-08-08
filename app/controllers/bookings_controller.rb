class BookingsController < ApplicationController
	before_action :set_listing, only: [:new, :create]

	def index
		@bookings = current_user.bookings.all
	end

	def new
		@booking = Booking.new
	end

	def create
		@booking = current_user.bookings.new(booking_params)
		@booking.listing = @listing

		if @booking.save
			date_range = convert_date(@booking.start_date, @booking.end_date)
			date_range.each do |date|
				AvailableDate.create(listing_id: @listing.id, date: date, availability: false)
			end
			redirect_to bookings_path
		else
			@errors = @booking.errors.full_messages
			render :new 
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to bookings_path
	end

	private

	def convert_date(start_date, end_date)
		start_date.to_date..end_date.to_date
	end

	def booking_params
		params.require(:booking).permit(:start_date, :end_date, :num_guest, :listing_id)
	end

	def set_listing
		@listing = Listing.find(params[:listing_id])
	end

end
