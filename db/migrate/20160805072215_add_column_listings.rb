class AddColumnListings < ActiveRecord::Migration
  def change
  	add_column :listings, :image, :json
  end
end
