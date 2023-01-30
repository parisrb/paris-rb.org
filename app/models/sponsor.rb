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
  mount_uploader :logo, PictureUploader

  scope :current, ->{ where('until >= ? OR until IS NULL', Time.current) }
  scope :latest,  -> (count) { order(until: :desc).limit(count) }

  def active?
    # this is ugly, we will need to rename the column to starts_at, ends_at as unitl is a reserved word
    self[:until].nil? || self[:until] >= Time.current && from <= Time.current
  end
end
