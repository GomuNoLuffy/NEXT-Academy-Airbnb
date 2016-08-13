class AddColumnsToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :country_code, :string
  	add_column :listings, :country, :string
  	add_column :listings, :max_guests, :integer
  	add_column :listings, :description, :text
  end
end
