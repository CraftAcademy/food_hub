class AddRatingToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :rating, :integer
  end
end
