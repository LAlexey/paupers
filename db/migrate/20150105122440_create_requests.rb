class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :owner
      t.belongs_to :service

      #t.date :date
      #t.time :time
      t.datetime :time
      t.string :comment

      t.timestamps
    end
  end
end
