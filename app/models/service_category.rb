class ServiceCategory < ActiveRecord::Base
  has_ancestry

  mount_uploader :image, ServiceCategoryUploader

  scope :nested_set,          -> { order(:position)  }
  scope :reversed_nested_set, -> { order(positon: :desc) }
end
