class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :vendor
      t.belongs_to :category

      t.string :title
      t.text :description
      t.string :type

      t.timestamps
    end

    add_index :services, :vendor_id
    add_index :services, :category_id
  end
end
