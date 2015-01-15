class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.belongs_to :vendor

      t.timestamps
    end
  end
end
