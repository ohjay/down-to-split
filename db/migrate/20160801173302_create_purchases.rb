class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.decimal :cost
      t.references :product, index: true
      t.references :shopping_trip, index: true

      t.timestamps null: false
    end
    add_foreign_key :purchases, :products
    add_foreign_key :purchases, :shopping_trips
  end
end
