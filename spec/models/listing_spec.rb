require 'rails_helper'

RSpec.describe Listing, type: :model do

	it { is_expected.to validate_presence_of(:title) }
	it { is_expected.to validate_presence_of(:address) }
	it { is_expected.to validate_presence_of(:description) }
	it { is_expected.to validate_presence_of(:price) }
	it { is_expected.to validate_presence_of(:max_guests) }
	it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:listing_tags).dependent(:destroy) }
  it { is_expected.to have_many(:tags).through(:listing_tags) }
  it { is_expected.to have_many(:bookings).dependent(:destroy) }
  it { is_expected.to have_many(:available_dates).dependent(:destroy) }

  describe "positive_price_and_guests" do
  	# let (:valid_params) { {title: "test", address: "test", price: 100, user_id: 1, country: "Singapore", max_guests: 4, description: "test"} }
  	# let (:invalid_params) { {title: "test", address: "test", price: -1, user_id: 1, country: "Singapore", max_guests: 0, description: "test"} }

  	it "only accept positive price and number of guests" do
  		let(:price) { 100 }
  		let(:max_guests) { 2 }
  		listing = Listing.new
  		expect{listing.positive_price_and_guests}.not_to raise_error
  	end
  end
end
