require "sitemap_generator"

class SitemapService
  def self.call
    new.call
  end

  def call
    SitemapGenerator::Sitemap.default_host = "https://paris-rb.org"
    SitemapGenerator::Sitemap.create do
      add videos_path,
        changefreq: "monthly",
        lastmod: Video.maximum(:updated_at),
        priority: 0.8

      Video.pluck(:slug, :updated_at).each do |video_slug, updated_at|
        add video_path(video_slug),
          changefreq: "yearly",
          lastmod: updated_at,
          priority: 1.0
      end

      add talks_path,
        changefreq: "weekly",
        lastmod: Talk.maximum(:updated_at),
        priority: 0.5
    end
    SitemapGenerator::Sitemap.ping_search_engines if Rails.env.production?
  end
end
