class ServiceCategory < ActiveRecord::Base
  include Permalinkable

  has_ancestry

  mount_uploader :image, ServiceCategoryUploader

  has_and_belongs_to_many :services

  scope :nested_set,          -> { order(:position)  }
  scope :reversed_nested_set, -> { order(positon: :desc) }

  def permalink_source
    title
  end
end
