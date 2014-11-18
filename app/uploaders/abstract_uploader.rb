class AbstractUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage Rails.env.production? ? :fog : :file
  # storage :fog

  process resize_to_limit: [ 1024, 1024 ]
  process convert: 'jpg'

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def store_dir
    "uploads/#{directory_name}/#{partition}"
  end

  def default_url
    "/images/fallback/#{directory_name}/#{version_name}.jpg"
  end

  def directory_name
    model.class.table_name
  end

  def filename
    if original_filename
      !changed? && model.read_attribute(mounted_as).presence || "#{secure_token}.jpg"
    end
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  private

  def changed?
    model.send(:"#{mounted_as}_changed?")
  end

  def partition
    ('%09d' % model.id).scan(/\d{3}/).join('/')
  end

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.hex(6))
  end
end
