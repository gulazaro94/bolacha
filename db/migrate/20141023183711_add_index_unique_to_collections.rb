class AddIndexUniqueToCollections < ActiveRecord::Migration
  def change
    add_index :collections, [:item_id, :user_id], unique: true
  end
end
