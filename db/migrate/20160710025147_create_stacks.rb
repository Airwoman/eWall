class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.string :img_url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
