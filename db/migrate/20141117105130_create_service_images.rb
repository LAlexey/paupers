class CreateServiceImages < ActiveRecord::Migration
  def change
    create_table :service_images do |t|
      t.belongs_to :service
      t.string :image
      t.string :title

      t.timestamps
    end
  end
end
