class ApplicationController < ActionController::Base
  include Auth

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  before_action :debug
  def debug
    sign_in User.find_by(email: 'mail@er.com') unless user_signed_in?
  end

  def home
    @best_services = Service.with_places.order(:id).all
    @categories = ServiceCategory.arrange
  end

  def popup
    @popup ||= Popup.new(view_context)
  end
  helper_method :popup
end
