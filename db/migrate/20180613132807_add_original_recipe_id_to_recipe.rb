class AddOriginalRecipeIdToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :original_recipe_id, array:true, default: '{}'
    add_column :recipes, :number_of_forks, :integer, default: 0
  end
end
