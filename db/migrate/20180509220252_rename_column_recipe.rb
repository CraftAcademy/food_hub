class RenameColumnRecipe < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :decsription, :description 
  end
end
