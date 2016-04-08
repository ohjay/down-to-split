class AddTotalToShoppingTrips < ActiveRecord::Migration
  def change
    add_column :shopping_trips, :total, :float
  end
end
