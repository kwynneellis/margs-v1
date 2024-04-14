class ChangeRecommendationTypeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :recommendations, :type, :recommendation_category
  end
end
