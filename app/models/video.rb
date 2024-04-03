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
  attr_accessor :skip_sitemap

  before_save :set_slug
  after_save :refresh_sitemap, unless: :skip_sitemap

  def provider
    return :vimeo if vimeo?
    :youtube if youtube?
  end

  def provider_id
    {
      youtube: youtube_id,
      viemo: vimeo_id
    }[provider]
  end

  def short_description
    description&.truncate(170, separator: " ")
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[vimeo_url title description slug]
  end

  private

  def vimeo_id
    vimeo_url[/vimeo.com\/(\d+)/, 1]
  end


  def vimeo?
    vimeo_id.present?
  end

  def youtube_id
    vimeo_url[/youtube.com\/watch\?v=(.*)/, 1]
  end

  def youtube?
    youtube_id.present?
  end

  def refresh_sitemap
    SitemapJob.perform_later
  end

  def set_slug
    self.slug = title.parameterize if slug.blank?
  end
end
