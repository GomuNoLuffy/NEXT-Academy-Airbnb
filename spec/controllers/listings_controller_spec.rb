require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
	
	let(:listing) { FactoryGirl.create(:listing)}

	describe '#index' do
		it 'gets all the listings' do
			get :index
			expect(assigns(:listings)).to eq nil
		end
	end

	describe '#create' do
		context "with valid params" do
			it "will create listing" do
				expect(Listing.all.count).to eq 0
				post :create, {listing:
					valid_params}
				expect(Listing.all.count).to eq 1
			end
		end
	end

end


