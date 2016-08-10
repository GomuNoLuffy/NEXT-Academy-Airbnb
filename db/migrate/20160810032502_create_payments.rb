class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.belongs_to :user
    	t.belongs_to :booking
    	t.boolean :paid
    	t.integer :amount
      t.timestamps null: false
    end
  end
end
