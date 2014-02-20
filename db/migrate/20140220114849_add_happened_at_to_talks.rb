class AddHappenedAtToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :happened_at, :date
    add_index :talks, :happened_at
  end
end
