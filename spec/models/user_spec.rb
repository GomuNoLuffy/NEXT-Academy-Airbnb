require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create(email: "martin@email.com")}

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to have_many(:listings) } 
  it { is_expected.to have_many(:bookings) }
  it { is_expected.to have_many(:payments) }
  
end
