# == Schema Information
#
# Table name: sponsors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  website    :string(255)
#  logo       :string(255)
#  from       :datetime
#  until      :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Sponsor < ActiveRecord::Base
  mount_uploader :logo, PictureUploader

  scope :visible, ->{ where('until >= ? OR until IS NULL', Time.current) }
end
