class RemoveLineupFromTalks < ActiveRecord::Migration[7.0]
  def up
    remove_column :talks, :lineup
  end

  def down
    add_column :talks, :lineup, :boolean, default: false
  end
end
