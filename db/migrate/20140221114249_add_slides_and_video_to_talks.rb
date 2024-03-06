class AddSlidesAndVideoToTalks < ActiveRecord::Migration[7.0]
  def change
    add_column :talks, :slides, :string
    add_column :talks, :video_slug, :string
  end
end
