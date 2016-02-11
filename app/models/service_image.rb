class ServiceImage < ActiveRecord::Base
  extend CarrierWave::Meta::ActiveRecord
  include RankedModel

  belongs_to :service

  ranks :position, with_same: :service_id

  mount_uploader :image, ServiceImageUploader
  serialize :image_meta, OpenStruct
  carrierwave_meta_composed :image_meta, image: [ :width, :height, :md5sum ]

  default_scope { order(:position) }

  [:thumb, :large_thumb, :full].each do |version|
    define_method version do
      image.url(version)
    end
  end

  def to_jq_upload
    image ?
    {
      id: self.id,
      position: self.position,
      thumbnailUrl: image.url(:thumb),
      name: image.url,
      type: image.content_type,
      url: image.url,
      deleteUrl: Rails.application.routes.url_helpers.destroy_file_admin_file_upload_path(file_klass: self.class.model_name, file_id: self.id),
      deleteType: 'DELETE',
      updateUrl: Rails.application.routes.url_helpers.update_file_admin_file_upload_path(file_klass: self.class.model_name, file_id: self.id),
      updateType: 'PATCH',
      title: self.title
    } : {}
  end
end
