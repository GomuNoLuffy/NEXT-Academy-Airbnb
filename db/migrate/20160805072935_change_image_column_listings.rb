class ChangeImageColumnListings < ActiveRecord::Migration
  def change
  	rename_column :listings, :image, :pictures
  end
end
