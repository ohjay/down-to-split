class AddDateToShoppingTrips < ActiveRecord::Migration
  def change
    add_column :shopping_trips, :date, :date
  end
end
