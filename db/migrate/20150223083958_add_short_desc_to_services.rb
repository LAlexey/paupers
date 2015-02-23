class AddShortDescToServices < ActiveRecord::Migration
  def change
    add_column :services, :short_desc, :string, limit: 300
  end
end
