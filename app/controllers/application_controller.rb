class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :debug
  def debug
    #sign_out :user
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
