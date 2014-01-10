class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string   :name
      t.string   :website
      t.string   :logo
      t.datetime :from
      t.datetime :until

      t.timestamps
    end
  end
end
