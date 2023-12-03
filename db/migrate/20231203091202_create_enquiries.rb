class CreateEnquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :enquiries do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.integer :nights
      t.integer :guests
      t.boolean :with_pets
      t.string :first_name
      t.string :last_name
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
