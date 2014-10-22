class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :item, index: true
      t.references :user, index: true
      t.boolean :repeated

      t.timestamps
    end
  end
end
