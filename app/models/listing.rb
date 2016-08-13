class Listing < ActiveRecord::Base
	searchkick
  belongs_to :user
	has_many :listing_tags
	has_many :tags, through: :listing_tags
  has_many :bookings
  has_many :available_dates

  attr_accessor :pictures
  mount_uploaders :pictures, ImageUploader

  def search_data
    {
      title: title,
      address: address,
      country: country
    }
  end
end
