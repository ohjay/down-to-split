class CreateShoppingTrips < ActiveRecord::Migration
  def change
    create_table :shopping_trips do |t|

      t.timestamps null: false
    end
  end
end
