class ProfileImage < ActiveRecord::Base
  extend CarrierWave::Meta::ActiveRecord

  belongs_to :owner, polymorphic: true

  mount_uploader :image, ProfileImageUploader
  serialize :image_meta, OpenStruct
  carrierwave_meta_composed :image_meta, image: [ :width, :height, :md5sum ]
end
