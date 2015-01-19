class AddCityToPlaces < ActiveRecord::Migration
  def change
    add_belongs_to :places, :city
  end
end
