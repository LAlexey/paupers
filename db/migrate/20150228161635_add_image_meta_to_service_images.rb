class AddImageMetaToServiceImages < ActiveRecord::Migration
  def change
    add_column :service_images, :image_meta, :text
  end
end
