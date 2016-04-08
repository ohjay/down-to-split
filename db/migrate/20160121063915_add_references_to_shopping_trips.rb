class AddReferencesToShoppingTrips < ActiveRecord::Migration
  def change
    add_reference :shopping_trips, :vendor, index: true
    add_foreign_key :shopping_trips, :vendors
  end
end
