class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.string :author
      t.string :twitter_handle
      t.string :cool_projects

      t.timestamps
    end
  end
end
