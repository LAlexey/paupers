module Tickets
  class Builder
    attr_reader :service, :current_user

    def initialize(current_user, params)
      @service = Service.find(params[:service_id])
      @current_user = current_user
    end

    def build
      Ticket.create(date: Date.current) do |ticket|
        ticket.service = service
        ticket.user = current_user
      end
    end
  end
end
