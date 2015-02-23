class Service < ActiveRecord::Base
  acts_as_votable

  belongs_to :vendor
  has_and_belongs_to_many :categories, class_name: '::ServiceCategory'
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
