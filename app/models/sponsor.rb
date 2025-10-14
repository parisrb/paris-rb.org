# == Schema Information
#
# Table name: sponsors
#
#  id               :bigint           not null, primary key
#  background_color :string           default("#ffffff")
#  from             :datetime
#  name             :string
#  until            :datetime
#  website          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Sponsor < ApplicationRecord
  # Associations
  has_one_attached :logo

  # Validations
  validates_format_of :website, with: /\A#{URI::DEFAULT_PARSER.make_regexp([ "http", "https" ])}\z/, message: "is not a valid URL", allow_blank: true

  # Scopes
  scope :current, -> { where("until >= ? OR until IS NULL", Time.current) }
  scope :latest,  -> { order(until: :desc) }
  scope :randomize, -> { order("random()") }

  def domain
    return if website.blank?

    website.gsub("https://", "").gsub("http://", "").gsub("www.", "")
  end
end
