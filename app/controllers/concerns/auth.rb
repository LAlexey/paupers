module Auth
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    flash[:alert] = 'Авторизуйтесь'
    redirect_to(request.referrer || root_path)
  end
end
