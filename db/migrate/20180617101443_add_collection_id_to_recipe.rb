class AddCollectionIdToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :collection, foreign_key: true
  end
end
