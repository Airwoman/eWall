class CreateJoinTableGroupPhoto < ActiveRecord::Migration
  def change
    create_join_table :groups, :photos do |t|
      t.index [:group_id, :photo_id]
      t.index [:photo_id, :group_id]
    end
  end
end
