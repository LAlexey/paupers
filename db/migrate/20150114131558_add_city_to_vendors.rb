class AddCityToVendors < ActiveRecord::Migration
  def change
    add_belongs_to :vendors, :city
  end
end
