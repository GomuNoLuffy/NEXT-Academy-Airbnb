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
  validates :price, :max_guests, numericality: { greater_than: 0 }

  def search_data
    {
      title: title,
      address: address,
      country: country
    }
  end
end
