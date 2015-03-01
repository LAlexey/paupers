class CabinetController < ApplicationController
  before_action :authenticate_user!

  def tickets
    @tickets = current_user.tickets.includes(:service, :vendor)
  end
end
