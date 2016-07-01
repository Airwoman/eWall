class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name
      t.string :email
      t.text :password_digest
      t.integer :role
      t.string :image

      t.timestamps null: false
    end
  end
end
