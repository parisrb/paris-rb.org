class Video < ActiveRecord::Base
  def vimeo_id
    vimeo_url[/vimeo.com\/(\d+)/, 1]
  end
end
