class CreateJoinTableEwall < ActiveRecord::Migration
  def change
    create_table :ewalls do |t|
      t.integer :user_id
      t.integer :photo_id
      t.string :positon_x
      t.string :positon_y
    end
  end
end
