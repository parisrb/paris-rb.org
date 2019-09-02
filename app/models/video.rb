# == Schema Information
#
# Table name: videos
#
#  id              :integer          not null, primary key
#  vimeo_url       :string
#  vimeo_thumbnail :string
#  title           :string
#  description     :text
#  event_date      :date
#  slug            :string
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_videos_on_slug  (slug) UNIQUE
#

class Video < ApplicationRecord
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
