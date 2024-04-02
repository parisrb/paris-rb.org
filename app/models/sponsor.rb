# == Schema Information
#
# Table name: sponsors
#
#  id         :integer          not null, primary key
#  name       :string
#  website    :string
#  logo       :string
#  from       :datetime
#  until      :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Sponsor < ApplicationRecord
  has_one_attached :logo

  scope :current, ->{ where('until >= ? OR until IS NULL', Time.current) }
  scope :latest,  -> (count) { order(until: :desc).limit(count) }

  def domain
    return if website.blank?

    website.gsub("https://", "").gsub("http://", "").gsub("www.", "")
  end

  def clearbit_logo_url
    "https://logo.clearbit.com/#{domain}"
  end

  rails_admin do
    list do
      field :name
      field :website
      field :from
      field :until
      field :logo do
        pretty_value do
          if bindings[:object].logo.attached?
            # this is a hack to display the Cloudinary image in the Rails Admin as we don't have a direct access
            # to the Cloudinary helper methods
            image_url = Rails.application.routes.url_helpers.rails_blob_url(bindings[:object].logo, only_path: true)
            bindings[:view].tag(:img, src: image_url, width: 100, height: 80, style: 'object-fit: contain;')
          else
            'No logo'
          end
        end
      end
    end
  end
end
