class ServiceCardWidgetPresenter < Keynote::Presenter
  presents :service

  delegate :title,
    :short_desc,
    :description,
    :price,
    to: :service

  def place
    service.place.try(:address)
  end

  def vendor
    service.vendor.name
  end

  def large_thumb
    service.main_image.image.large_thumb.url
  end
end
