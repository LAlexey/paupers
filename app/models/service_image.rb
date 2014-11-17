class ServiceImage < ActiveRecord::Base
  belongs_to :service

  mount_uploader :image, ServiceImageUploader

  def to_jq_upload
    {
      'thumbnailUrl' => image.url,
      'name' => image.identifier,
      'type' => image.content_type,
      'url' => image.url,
      'deleteUrl' => '',
      'deleteType' => 'DELETE'
    }
  end
end
