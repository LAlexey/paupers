class Vendor < ActiveRecord::Base
  has_many :places
  accepts_nested_attributes_for :places, allow_destroy: true
end
