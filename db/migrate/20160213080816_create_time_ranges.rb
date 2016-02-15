class CreateTimeRanges < ActiveRecord::Migration
  def change
    create_table :time_ranges do |t|
      t.belongs_to :item, polymorphic: true,  nil: false
      t.column :during, :int4range,           nil: false
    end
  end
end
