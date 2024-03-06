class AddPreferredTalkMonthToTalk < ActiveRecord::Migration[7.0]
  def change
    add_column :talks, :preferred_month_talk, :string
  end
end
