class RenameGuestsColToMaxGuests < ActiveRecord::Migration[6.1]
  def change
    rename_column :properties, :guests, :max_guests
  end
end
