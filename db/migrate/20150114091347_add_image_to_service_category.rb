class AddImageToServiceCategory < ActiveRecord::Migration
  def change
    add_column :service_categories, :image, :string
  end
end
