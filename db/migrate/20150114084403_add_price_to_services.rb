class AddPriceToServices < ActiveRecord::Migration
  def change
    add_column :services, :price, :integer
    add_column :services, :currency, :string
  end
end
