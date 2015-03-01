class AddVendorIdToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :vendor
  end
end
