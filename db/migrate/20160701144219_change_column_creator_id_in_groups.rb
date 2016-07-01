class ChangeColumnCreatorIdInGroups < ActiveRecord::Migration
  def up
    change_column :groups, :creator_id, 'integer USING CAST(creator_id AS integer)'
  end

  def down
    change_column :groups, :creator_id, :string
  end
end
