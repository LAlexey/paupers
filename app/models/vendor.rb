class Vendor < ActiveRecord::Base
  has_many :places
  accepts_nested_attributes_for :places

  belongs_to :city
end
