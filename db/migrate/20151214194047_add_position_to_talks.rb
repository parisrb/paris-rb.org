class AddPositionToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :position, :integer
  end
end
