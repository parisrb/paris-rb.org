class AddTimeToTalk < ActiveRecord::Migration[7.0]
  def change
    add_column :talks, :time_position, :datetime
  end
end
