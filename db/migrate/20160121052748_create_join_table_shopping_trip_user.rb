class CreateJoinTableShoppingTripUser < ActiveRecord::Migration
  def change
    create_table :shopping_trips_users, id: false do |t|
      t.integer :shopping_trip_id
      t.integer :user_id
    end
    add_index :shopping_trips_users, :shopping_trip_id
    add_index :shopping_trips_users, :user_id
  end
end
