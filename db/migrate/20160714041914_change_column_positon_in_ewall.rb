class ChangeColumnPositonInEwall < ActiveRecord::Migration
  def change
    rename_column :ewalls, :positon_x, :position_x
    rename_column :ewalls, :positon_y, :position_y
  end
end
