class ProfileImageUploader < AbstractUploader
  include CarrierWave::Meta

  process store_meta: [ { md5sum: true } ]

  version :thumb do
    process :resize_to_fit => [100, 100]
  end
end
