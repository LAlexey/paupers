class Service < ActiveRecord::Base
  belongs_to :service_category
  belongs_to :vendor

  validates :services_category, :vendor, presence: true
end
