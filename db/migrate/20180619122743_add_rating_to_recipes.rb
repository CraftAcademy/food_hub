class AddRatingToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :average_rating, :integer
  end
end
