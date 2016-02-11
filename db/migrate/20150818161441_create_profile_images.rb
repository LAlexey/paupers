class CreateProfileImages < ActiveRecord::Migration
  def change
    create_table :profile_images do |t|
      t.string :image
      t.belongs_to :owner, polymorphic: true
      t.text :image_meta

      t.timestamps
    end
  end
end
