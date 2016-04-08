class AddPurchaseToDebts < ActiveRecord::Migration
  def change
    add_reference :debts, :purchase, index: true
    add_foreign_key :debts, :purchases
  end
end
