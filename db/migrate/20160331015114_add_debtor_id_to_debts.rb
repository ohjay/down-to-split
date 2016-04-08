class AddDebtorIdToDebts < ActiveRecord::Migration
  def change
    add_column :debts, :debtor_id, :integer
  end
end
