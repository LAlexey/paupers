class VendorsController < ApplicationController
  before_action :authenticate_user!

  def show

  end

  protected
  def set_vendor
    @vendor = Vendor.find(params[:id])
  end
end
