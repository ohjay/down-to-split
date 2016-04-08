class AddShoppingTripToDebts < ActiveRecord::Migration
  def change
    add_reference :debts, :shopping_trip, index: true
    add_foreign_key :debts, :shopping_trips
  end
end
