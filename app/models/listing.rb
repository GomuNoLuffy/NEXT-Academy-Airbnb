class Listing < ActiveRecord::Base
	searchkick
  belongs_to :user
	has_many :listing_tags , dependent: :destroy
	has_many :tags, through: :listing_tags
  has_many :bookings, dependent: :destroy
  has_many :available_dates, dependent: :destroy

  attr_accessor :pictures
  mount_uploaders :pictures, ImageUploader

  validates :title, :address, :description, :price, :max_guests, presence: true
  validate :positive_price_and_guests

  def positive_price_and_guests
    if price > 0 and max_guests > 0
      return
    else
      errors.add(:invalid_input, "price or maximum guests must be more than 0")
    end
  end

  def search_data
    {
      title: title,
      address: address,
      country: country
    }
  end
end
