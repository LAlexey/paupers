class TicketsController < ApplicationController
  expose(:ticket, attributes: :ticket_params)

  before_action :set_vendor, only: :index

  def index
    @tickets = Ticket.all
    @tickets = @tickets.with_vendor(@vendor) if @vendor
    @tickets = @tickets.paginate(page: params[:page])
  end

  def create
    request = Tickets::Builder.new(current_user, params).build
    redirect_to request
  end

  def update
    ticket.confirm

    if ticket.save
      redirect_to root_path, notice: 'Заявка принята. В ближайшее время с Вами свяжется мастер.'
    else
      redirect_to ticket
    end
  end

  private

  def ticket_params
    params[:ticket].permit(:date, :comment)
  end

  def set_vendor
    @vendor = Vendor.find(params[:vendor_id]) if params[:vendor_id]
  end
end
