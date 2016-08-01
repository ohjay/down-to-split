class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.float :cost
      t.references :creditor, index: true
      t.references :debtor, index: true

      t.timestamps null: false
    end
    add_foreign_key :debts, :creditors
    add_foreign_key :debts, :debtors
  end
end
