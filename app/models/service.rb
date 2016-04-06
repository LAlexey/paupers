class Service < ActiveRecord::Base
  acts_as_votable

  update_index('services', :self)

  belongs_to :vendor
  validates :vendor, presence: true

  has_and_belongs_to_many :categories, class_name: '::ServiceCategory'
  has_many :images, class_name: '::ServiceImage', inverse_of: :service

  has_one :place
  accepts_nested_attributes_for :place, allow_destroy: true

  has_many :time_ranges, as: :item

  validate :ensure_has_category

  scope :with_places, -> { includes(place: :city) }

  def main_image
    images.order(:position).first
  end

  def min_price
    900
  end

  private
  def ensure_has_category
    errors.add(:base, 'Услуга должна быть хотя бы в одной категории') unless categories.any?
  end
end
