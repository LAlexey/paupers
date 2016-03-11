class Vendor < ActiveRecord::Base
  include Permalinkable

  belongs_to :user

  has_many :time_ranges, as: :item

  validates :name, :description, presence: true
  validates :description, length: { minimum: 5 }

  def permalink_source
    name
  end
end
