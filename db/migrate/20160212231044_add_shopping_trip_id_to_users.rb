class AddShoppingTripIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :shopping_trip_id, :integer
  end
end
