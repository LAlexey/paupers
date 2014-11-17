class Popup
  attr_reader :v

  def initialize(view_context)
    @v = view_context
  end

  def show_auth_popup!(auth_error_type)
    session[:auth_error] = auth_error_type
  end

  def need_show_auth_popup?
    auth_error.present?
  end

  protected

  def auth_error
    @auth_error ||= session.delete(:auth_error)
  end

  private
  def session
    @session ||= v.session
  end
end
