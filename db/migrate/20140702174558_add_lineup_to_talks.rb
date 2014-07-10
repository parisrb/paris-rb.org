class AddLineupToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :lineup, :boolean, default: false, index: true
  end
end
