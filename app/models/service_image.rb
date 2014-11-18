class ServiceImage < ActiveRecord::Base
  belongs_to :service

  mount_uploader :image, ServiceImageUploader

  def to_jq_upload
    {
      'thumbnailUrl' => image.url(:thumb),
      'name' => image.url,
      'type' => image.content_type,
      'url' => image.url,
      'deleteUrl' => Rails.application.routes.url_helpers.destroy_file_admin_file_upload_path(file_klass: self.class.model_name, file_id: self.id),
      'deleteType' => 'DELETE'
    }
  end
end
