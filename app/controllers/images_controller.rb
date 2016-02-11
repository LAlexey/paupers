class ImagesController < ApplicationController
  def create
    file = attachment_params[:file]
    head :ok
  end

  def set_type

  end

  private

  def attachment_params
    params.require(:image).permit(:file)
  end
end
