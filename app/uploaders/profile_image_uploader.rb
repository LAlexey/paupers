class ProfileImageUploader < AbstractUploader
  include CarrierWave::Meta

  process resize_to_limit: [ 1024, 1024 ]
  process convert: 'jpg'
  process store_meta: [ { md5sum: true } ]


  version :thumb do
    process :update_version
  end

  # version :thumb do
  #   process :resize_to_fit => [100, 100]
  # end

  private

  def update_version
    # model.#
    #version_name

    manipulate! do |img|
      img.crop "#{10}x#{10}+#{100}+#{100}"
      img
    end
  end
end
