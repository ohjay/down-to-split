class AddNameToShoppingTrips < ActiveRecord::Migration
  def change
    add_column :shopping_trips, :name, :string
  end
end
