class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :edit, :update, :destroy]

	def index
    if params[:search_result] == "all"
    	@listings = Listing.all
    else
    	@listings = Listing.search params[:search_result]
    end
	end

	def show
	end

	def new
		@listing = Listing.new
	end

	def edit
	end

	def create
		@listing = current_user.listings.new(listing_params)

		respond_to do |format|
			if @listing.save
				@listing.update(country: ISO3166::Country[params[:listing][:country_code]].name)
				format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	def update
		@listing.update(listing_params)
		redirect_to @listing
	end

	def destroy
		Booking.where(listing_id: @listing.id).destroy_all
		@listing.destroy
		redirect_to listings_path
	end

	private

	def set_listing
		@listing = Listing.find(params[:id])
	end

	def listing_params
		params.require(:listing).permit(:title, :address, :price, :country_code, :max_guests, :description, :remove_pictures, tag_ids: [], pictures: [])
	end

end


