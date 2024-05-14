class AddCreatedAtIndexForTalks < ActiveRecord::Migration[7.1]
  def change
    add_index :talks, :created_at
  end
end
