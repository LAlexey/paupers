class AddPositionToServiceImages < ActiveRecord::Migration
  def change
    add_column :service_images, :position, :integer

    add_index :service_images, [:position, :service_id], unique: true
  end
end
