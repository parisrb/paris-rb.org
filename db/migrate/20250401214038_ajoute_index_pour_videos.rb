class AjouteIndexPourVideos < ActiveRecord::Migration[7.1]
  def change
    add_index :videos, :event_date
  end
end
