class RenameVimeoUrlFromVideos < ActiveRecord::Migration[7.1]
  def change
    rename_column :videos, :vimeo_url, :url
    rename_column :videos, :vimeo_thumbnail, :thumbnail_url
  end
end
