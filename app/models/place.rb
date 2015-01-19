class Place < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  belongs_to :vendor
  belongs_to :city

  def full_address
    "#{city.name} #{address}"
  end
end
