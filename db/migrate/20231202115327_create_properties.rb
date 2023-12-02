class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :description
      t.integer :price_per_night
      t.integer :minimum_nights
      t.integer :cleaning_fee
      t.integer :guests
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :pet_friendly

      t.timestamps
    end
  end
end
