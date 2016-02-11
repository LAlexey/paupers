class CabinetController < ApplicationController
  before_action :authenticate_user!

  def tickets
    @tickets = current_user.tickets.includes(:service, :vendor)
  end

  def update
    current_user.update(user_params)

    if request.xhr?
      render json: current_user.to_json
    else
      redirect_to cabinet_url
    end
  end

  def user_params
    params[:user].permit(profile_image_attributes: [:image])
  end
end
