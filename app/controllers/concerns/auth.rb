module Auth
  extend ActiveSupport::Concern

  included do
    include Pundit
  end

  def only_for_users
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
