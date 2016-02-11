class ServiceImageUploader < AbstractUploader
  include CarrierWave::Meta

  process store_meta: [ { md5sum: true } ]

  version :thumb do
     process :resize_to_fit => [100, 100]
  end

  version :large_thumb do
    process :resize_to_fit => [220, nil]
  end

  version :full do
    process :resize_to_fit => [700, nil]
  end
end
