class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :picture
      t.string :description
      t.boolean :kind
      t.references :category, index: true

      t.timestamps
    end
  end
end
