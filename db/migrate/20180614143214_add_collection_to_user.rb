class AddCollectionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :collection, :string, array: true, default: "{}"
  end
end
