class RemoveLineupFromTalks < ActiveRecord::Migration
  def up
    remove_column :talks, :lineup
  end

  def down
    add_column :talks, :lineup, :boolean, default: false
  end
end
