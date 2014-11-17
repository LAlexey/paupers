class Service < ActiveRecord::Base
  belongs_to :category, class_name: 'ServiceCategory'
  belongs_to :vendor

  has_many :images, class_name: 'ServiceImage'

  validates :category, :vendor, presence: true
end
