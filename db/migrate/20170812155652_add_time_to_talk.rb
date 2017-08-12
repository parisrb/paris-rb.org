class AddTimeToTalk < ActiveRecord::Migration
  def change
    add_column :talks, :time_position, :datetime
  end
end
