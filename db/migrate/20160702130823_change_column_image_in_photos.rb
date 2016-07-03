class ChangeColumnImageInPhotos < ActiveRecord::Migration
  def up
    change_column :photos, :image, 'json USING CAST(image AS json)'
  end

  def down
    change_column :photos, :image, :string
  end
end
