require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://rubyparis.org'
SitemapGenerator::Sitemap.create do
  add videos_path,
    changefreq: 'monthly',
    lastmod: Video.maximum(:updated_at),
    priority: 0.8

  Video.pluck(:slug, :updated_at).each do |video_slug, updated_at|
    add video_path(video_slug),
      changefreq: 'yearly',
      lastmod: updated_at,
      priority: 1.0
  end

  add talks_path,
    changefreq: 'weekly',
    lastmod: Talk.maximum(:updated_at),
    priority: 0.5
end
