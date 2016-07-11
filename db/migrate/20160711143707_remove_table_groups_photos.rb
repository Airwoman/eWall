class RemoveTableGroupsPhotos < ActiveRecord::Migration
  def up
    drop_table :groups_photos
  end

  def down
    create_join_table :groups, :photos do |t|
      t.index [:group_id, :photo_id]
      t.index [:photo_id, :group_id]
    end
  end
end
