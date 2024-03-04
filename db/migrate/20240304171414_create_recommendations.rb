class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.string :title
      t.string :subtitle
      t.string :description
      t.string :embedded_map
      t.string :type
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
