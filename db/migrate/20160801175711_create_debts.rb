class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.float :cost
      t.integer :creditor
      t.integer :debtor

      t.timestamps null: false
    end
  end
end
