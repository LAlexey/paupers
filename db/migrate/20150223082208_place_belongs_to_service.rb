class PlaceBelongsToService < ActiveRecord::Migration
  def change
    remove_column :places, :vendor_id
    add_column    :places, :service_id, :integer
  end
end
