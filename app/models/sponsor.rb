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
  scope :latest,  -> (count) { order('until DESC').limit(count) }
end
