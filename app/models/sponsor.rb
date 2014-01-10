class Sponsor < ActiveRecord::Base
  mount_uploader :logo, PictureUploader

  scope :visible, ->{ where('until >= ?', Time.current) }
end
