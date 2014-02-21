class Video < ActiveRecord::Base
  before_save :set_slug
  after_save :refresh_sitemap

  def vimeo_id
    vimeo_url[/vimeo.com\/(\d+)/, 1]
  end

  private

  def refresh_sitemap
    SitemapWorker.new.async.perform
  end

  def set_slug
    self.slug = title.parameterize if slug.blank?
  end
end
