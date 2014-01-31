class Video < ActiveRecord::Base
  before_save :set_slug

  def vimeo_id
    vimeo_url[/vimeo.com\/(\d+)/, 1]
  end

  private

  def set_slug
    self.slug = title.parameterize if slug.blank?
  end
end
