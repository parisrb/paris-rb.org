class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :vimeo_url
      t.string :vimeo_thumbnail
      t.string :title
      t.text   :description
      t.date   :event_date
      t.string :slug

      t.timestamps
    end

    add_index :videos, :vimeo_id, unique: true
    add_index :videos, :slug, unique: true
  end
end
