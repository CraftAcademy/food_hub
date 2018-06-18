class AddOriginalRecipeIdToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :original_recipe_id, :integer
    add_column :recipes, :forked_recipes_ids, :string, array: true, default: '{}'
  end
end
