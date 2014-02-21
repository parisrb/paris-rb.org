class AddSlidesAndVideoToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :slides, :string
    add_column :talks, :video_slug, :string
  end
end
