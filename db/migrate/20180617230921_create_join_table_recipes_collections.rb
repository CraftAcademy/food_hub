class CreateJoinTableRecipesCollections < ActiveRecord::Migration[5.2]
  def change
    create_join_table :recipes, :collections do |t|
      t.index [:recipe_id, :collection_id]
      t.index [:collection_id, :recipe_id]
    end
  end
end
