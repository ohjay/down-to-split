class AddDefaultTotalToShoppingTrips < ActiveRecord::Migration
  def change
  	change_column :shopping_trips, :total, :float, :default => 0.0
  end
end
