class ServiceCategoryUploader < AbstractUploader

  version :thumb do
     process :resize_to_fit => [128, 128]
  end
end
