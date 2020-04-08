class AddPitchToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :pitch, :text
  end
end
