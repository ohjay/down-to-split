class AddReferencesToPurchases < ActiveRecord::Migration
  def change
    add_reference :purchases, :shopping_trip, index: true
    add_foreign_key :purchases, :shopping_trips
  end
end
