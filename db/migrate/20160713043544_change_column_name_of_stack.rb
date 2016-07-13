class ChangeColumnNameOfStack < ActiveRecord::Migration
  def change
    rename_column :stacks, :img_url, :photo_id
  end
end
