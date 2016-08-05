 class AddShoppingTripsUsers < ActiveRecord::Migration
  def self.up
    create_table :shopping_trips_users, :id => false do |t|
      t.integer :shopping_trip_id
      t.integer :user_id
    end
  end

   def self.down
     drop_table :shopping_trips_users
   end
end
