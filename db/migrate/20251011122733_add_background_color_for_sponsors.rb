class AddBackgroundColorForSponsors < ActiveRecord::Migration[7.2]
  def change
    add_column :sponsors, :background_color, :string
  end
end
