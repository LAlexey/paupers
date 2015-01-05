class Service < ActiveRecord::Base
  belongs_to :vendor

  has_and_belongs_to_many :categories, class_name: '::ServiceCategory'
  #accepts_nested_attributes_for :categories, allow_destroy: true

  has_many :images, class_name: 'ServiceImage', inverse_of: :service

  validates :vendor, presence: true

  validate :ensure_has_category

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
