class AddLineupToTalks < ActiveRecord::Migration[7.0]
  def change
    add_column :talks, :lineup, :boolean, default: false, index: true
  end
end
