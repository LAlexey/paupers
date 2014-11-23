class AddAncestryToServiceCategories < ActiveRecord::Migration
  def change
    add_column :service_categories, :ancestry, :string

    add_index :service_categories, :ancestry
  end
end
