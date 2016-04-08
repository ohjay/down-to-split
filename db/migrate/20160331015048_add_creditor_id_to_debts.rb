class AddCreditorIdToDebts < ActiveRecord::Migration
  def change
    add_column :debts, :creditor_id, :integer
  end
end
