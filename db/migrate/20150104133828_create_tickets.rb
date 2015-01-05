class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :owner
      t.belongs_to :vendor

      t.date :date
      t.string :comment

      t.timestamps
    end
  end
end
