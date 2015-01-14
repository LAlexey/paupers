class RequestsController < ApplicationController
  def create
    form = RequestForm.new(request_params)
    if form.valid?
      form.persist!
    end

    render nothing: true
  end

  private

  def request_params
    params[:request].permit(:date, :time, :comment)
  end
end
