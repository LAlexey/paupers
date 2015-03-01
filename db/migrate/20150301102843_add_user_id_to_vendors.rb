class AddUserIdToVendors < ActiveRecord::Migration
  def change
    add_belongs_to :vendors, :user
  end
end
