class PaymentsController < ApplicationController
	
	def new
		@payment = Payment.new
		gon.client_token = generate_client_token
	end

	def create
    @result = Braintree::Transaction.sale(
              amount: total_price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      current_user.payments.create(booking_id: @booking.id, paid: true, amount: total_price, transaction_id: @result.transaction.id)
      redirect_to root_url, notice: "Congraulations! Your transaction has been successfully!"
    else
    	
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

	private

	def total_price
		@booking = Booking.find(params[:booking_id])
		@listing = @booking.listing
		price_per_night = @listing.price
		num_days = (@booking.start_date..@booking.end_date).count - 1
		return price_per_night * num_days
	end

	def generate_client_token
  	Braintree::ClientToken.generate
	end

end
