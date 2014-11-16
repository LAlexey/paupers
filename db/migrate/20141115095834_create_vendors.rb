class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :permalink
      t.text :description

      t.timestamps
    end
  end
end
