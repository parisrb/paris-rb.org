# == Schema Information
#
# Table name: videos
#
#  id              :integer          not null, primary key
#  vimeo_url       :string(255)
#  vimeo_thumbnail :string(255)
#  title           :string(255)
#  description     :text
#  event_date      :date
#  slug            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_videos_on_slug  (slug) UNIQUE
#

class Video < ActiveRecord::Base
  before_save :set_slug

  def vimeo_id
    vimeo_url[/vimeo.com\/(\d+)/, 1]
  end

  private def set_slug
    self.slug ||= title.parameterize
  end
end
