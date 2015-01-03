class AddPositionToServiceCategories < ActiveRecord::Migration
  def change
    add_column :service_categories, :position, :integer
  end
end
