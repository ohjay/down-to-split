class AddUserIdColumnToShoppingTrips < ActiveRecord::Migration
  def change
    add_column :shopping_trips, :user_id, :integer
  end
end
