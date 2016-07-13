class ChangePhotoIdFormatInStacksTable < ActiveRecord::Migration
  def up
    change_column :stacks, :photo_id, 'integer USING CAST(photo_id AS integer)'
  end

  def down
    change_column :stacks, :photo_id, :string
  end
end
