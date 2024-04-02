class RemoveLogoFromSponsor < ActiveRecord::Migration[7.0]
  def change
    remove_column :sponsors, :logo, :string
  end
end
