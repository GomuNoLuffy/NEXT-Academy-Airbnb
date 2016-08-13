class AddColumnListings < ActiveRecord::Migration
  def change
  	add_column :listings, :pictures, :json
  end
end
