class TicketsController < ApplicationController
  expose(:ticket, attributes: :ticket_params)

  def create
    request = Tickets::Builder.new(current_user, params).build
    redirect_to request
  end

  def show
  end

  def update
    if ticket.save
      redirect_to root_path, notice: 'Заявка подтверждена!'
    else
      redirect_to ticket
    end
  end

  private

  def ticket_params
    params[:ticket].permit(:time, :comment)
  end
end
