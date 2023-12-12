class AddTitleToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :title, :string
    add_column :properties, :description2, :string
  end
end
