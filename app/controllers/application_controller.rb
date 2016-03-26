class ApplicationController < ActionController::Base
  include Auth

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  before_action :init_gon
  after_action do
    response.headers.delete('X-Frame-Options')
  end

  def home
    @best_services = Service.with_places.order(:id).all
    @categories = ServiceCategory.arrange
  end

  def test
    t=0
  end

  def frame

  end

  def popup
    @popup ||= Popup.new(view_context)
  end
  helper_method :popup

  def init_gon
    gon.data_layer = {
      page_options: gon_page_options
    }
  end

  #TODO override
  def gon_page_options
    "#{controller_path}_#{action_name}"
  end
end
