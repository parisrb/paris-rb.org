# == Schema Information
#
# Table name: sponsors
#
#  id         :bigint           not null, primary key
#  from       :datetime
#  name       :string
#  until      :datetime
#  website    :string
#  created_at :datetime
#  updated_at :datetime
#

class Sponsor < ApplicationRecord
  has_one_attached :logo

  scope :current, -> { where("until >= ? OR until IS NULL", Time.current) }
  scope :latest,  ->(count) { order(until: :desc).limit(count) }

  def domain
    return if website.blank?

    website.gsub("https://", "").gsub("http://", "").gsub("www.", "")
  end

  def clearbit_logo_url
    return "test/fixtures/files/logo.png" if Rails.env.test? # avoids making requests to Clearbit in tests during the database smoke tests

    "https://logo.clearbit.com/#{domain}"
  end
end
