# Need to define default cache strategy
# https://github.com/carrierwaveuploader/carrierwave/commit/629afecbaeccd2300e4660b78ee36bd95dd845c5
CarrierWave.configure do |config|
 config.cache_storage = :file
end
