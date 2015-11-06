class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.date :date_purchased
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
