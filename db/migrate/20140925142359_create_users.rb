class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :picture
      t.date :birth_date
      t.text :bio
      t.boolean :admin
      t.string :token
      t.timestamps

      t.index :email, unique: true
    end
  end
end
