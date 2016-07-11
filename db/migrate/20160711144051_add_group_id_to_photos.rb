class AddGroupIdToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :group, index: true, foreign_key: true
  end
end
