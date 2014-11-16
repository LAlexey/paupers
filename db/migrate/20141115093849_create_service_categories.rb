class CreateServiceCategories < ActiveRecord::Migration
  def change
    create_table :service_categories do |t|
      t.string :title
      t.string :permalink
    end
  end
end
