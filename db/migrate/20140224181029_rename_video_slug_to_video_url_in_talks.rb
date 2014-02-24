class RenameVideoSlugToVideoUrlInTalks < ActiveRecord::Migration
  def change
    rename_column :talks, :video_slug, :video_url
  end
end
