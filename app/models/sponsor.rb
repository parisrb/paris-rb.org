class Sponsor < ActiveRecord::Base
  mount_uploader :logo, PictureUploader

  scope :visible, ->{ where('until >= ? OR until IS NULL', Time.current) }
end
