class DropRailsAdminHistories < ActiveRecord::Migration[7.0]
  def change
    drop_table :rails_admin_histories
  end
end
