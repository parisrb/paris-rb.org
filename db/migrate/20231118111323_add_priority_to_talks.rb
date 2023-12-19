class AddPriorityToTalks < ActiveRecord::Migration[7.0]
  def change
    add_column :talks, :priority, :string
  end
end
