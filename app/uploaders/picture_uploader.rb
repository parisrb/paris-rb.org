class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumbnail do
    resize_to_fit(180, 100)
  end
end
