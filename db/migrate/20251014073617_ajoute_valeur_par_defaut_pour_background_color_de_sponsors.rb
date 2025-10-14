class AjouteValeurParDefautPourBackgroundColorDeSponsors < ActiveRecord::Migration[7.2]
  def change
    change_column_default :sponsors, :background_color, from: nil, to: "#ffffff"
  end
end
