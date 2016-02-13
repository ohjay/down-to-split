class AddPayerToShoppingTrips < ActiveRecord::Migration
  def change
    add_column :shopping_trips, :payer, :string
  end
end
