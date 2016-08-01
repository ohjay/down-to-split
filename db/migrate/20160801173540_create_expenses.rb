class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.float :percentage
      t.references :purchase, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :expenses, :purchases
    add_foreign_key :expenses, :users
  end
end
