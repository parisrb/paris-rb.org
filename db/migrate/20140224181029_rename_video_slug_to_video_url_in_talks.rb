class RenameVideoSlugToVideoUrlInTalks < ActiveRecord::Migration[7.0]
  def change
    rename_column :talks, :video_slug, :video_url
  end
end
