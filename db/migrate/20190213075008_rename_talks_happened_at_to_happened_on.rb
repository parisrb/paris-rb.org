class RenameTalksHappenedAtToHappenedOn < ActiveRecord::Migration[5.2]
  def change
    rename_column :talks, :happened_at, :happened_on
  end
end
