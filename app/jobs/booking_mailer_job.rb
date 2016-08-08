class BookingMailerJob < ActiveJob::Base
  queue_as :default

  def perform(customer, booking, listing)
    # Do something later
    BookingMailer.booking_email(customer, booking, listing).deliver_now
  end
end
