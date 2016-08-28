require 'rails_helper'
require 'byebug'

RSpec.describe Listing, type: :model do
  let(:user) {User.create(email: "martin@email.com", encrypted_password: "test")}

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

  describe "numericality of price and guests" do
  	let (:valid_params) { {title: "test", address: "test", price: 100, user_id: 1, country: "Singapore", max_guests: 4, description: "test", user_id: user.id} }
  	let (:invalid_params) { {title: "test", address: "test", price: -1, user_id: 1, country: "Singapore", max_guests: 0, description: "test", user_id: user.id} }

  	it "only accept positive price and positive number of guests" do
  		listing = Listing.create(valid_params)
  		expect{listing}.not_to raise_error

      listing = Listing.create(invalid_params)
      expect{listing}.to raise_error ArgumentError
  	end
  end
end
