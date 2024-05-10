# == Schema Information
#
# Table name: videos
#
#  id              :bigint           not null, primary key
#  description     :text
#  event_date      :date
#  slug            :string
#  title           :string
#  vimeo_thumbnail :string
#  vimeo_url       :string
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_videos_on_slug  (slug) UNIQUE
#


# They are some legacy code from the Vimeo time
# we have now moved the videos to youtube and most vimeo videos link are broken
# at some point it would be nice to remove the vimeo attributes and replace them with more generic ones
# provider and provider_id are computed for now but they could become the real attributes at the end
class Video < ApplicationRecord
  attr_accessor :skip_sitemap

  scope :chronologically, -> { order(event_date: :desc) }

  before_save :set_slug
  after_save :refresh_sitemap, unless: :skip_sitemap

  def provider
    return :vimeo if vimeo?
    :youtube if youtube?
  end

  def provider_id
    {
      youtube: youtube_id,
      vimeo: vimeo_id
    }[provider]
  end

  def vimeo_thumbnail
    return "https://img.youtube.com/vi/#{youtube_id}/maxresdefault.jpg" if youtube?

    self[:vimeo_thumbnail].presence || "#"
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

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
