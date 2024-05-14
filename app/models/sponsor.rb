# == Schema Information
#
# Table name: sponsors
#
#  id         :bigint           not null, primary key
#  from       :datetime
#  name       :string
#  until      :datetime
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sponsor < ApplicationRecord
  # Associations
  has_one_attached :logo

  # Validations
  validates :website, presence: true
  validates_format_of :website, with: /\A#{URI::DEFAULT_PARSER.make_regexp([ "http", "https" ])}\z/, message: "is not a valid URL", allow_blank: true

  # Scopes
  scope :current, -> { where("until >= ? OR until IS NULL", Time.current) }
  scope :latest,  ->(count) { order(until: :desc).limit(count) }
  scope :randomize, -> { order("random()") }

  def domain
    return if website.blank?

    website.gsub("https://", "").gsub("http://", "").gsub("www.", "")
  end

  def clearbit_logo_url
    return "test/fixtures/files/logo.png" if Rails.env.test? # avoids making requests to Clearbit in tests during the database smoke tests

    "https://logo.clearbit.com/#{domain}"
  end
end
