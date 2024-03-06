class AddHappenedAtToTalks < ActiveRecord::Migration[7.0]
  def change
    add_column :talks, :happened_at, :date
    add_index :talks, :happened_at
  end
end
