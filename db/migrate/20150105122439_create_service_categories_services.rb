class CreateServiceCategoriesServices < ActiveRecord::Migration
  def change
    create_table :service_categories_services do |t|
      t.belongs_to :service_category
      t.belongs_to :service
    end

    remove_column :services, :category_id
  end
end
