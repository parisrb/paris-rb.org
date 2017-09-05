class AddPreferredTalkMonthToTalk < ActiveRecord::Migration
  def change
    add_column :talks, :preferred_month_talk, :string
  end
end
