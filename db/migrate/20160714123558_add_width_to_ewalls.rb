class AddWidthToEwalls < ActiveRecord::Migration
  def change
    add_column :ewalls, :width, :string
    add_column :ewalls, :height, :string
  end
end
