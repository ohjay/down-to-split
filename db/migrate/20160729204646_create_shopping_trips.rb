class CreateShoppingTrips < ActiveRecord::Migration
  def change
    create_table :shopping_trips do |t|
      t.string :name
      t.references :vendor, index: true
      t.integer :payer_id
      t.float :total
      t.date :date

      t.timestamps null: false
    end
    add_foreign_key :shopping_trips, :vendors
  end
end
