class Tag < ActiveRecord::Base
	has_many :listing_tags, dependent: :destroy
	has_many :listings, through: :listing_tags
end
