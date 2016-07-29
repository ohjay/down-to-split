class CreateShoppingTrips < ActiveRecord::Migration
  def change
    create_table :shopping_trips do |t|
      t.string :name
      t.references :vendor, index: true
      t.references :user, index: true
      t.float :total
      t.date :date

      t.timestamps null: false
    end
    add_foreign_key :shopping_trips, :vendors
    add_foreign_key :shopping_trips, :users
  end
end
