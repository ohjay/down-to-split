class RenameDebtColumn < ActiveRecord::Migration
  def change
  	rename_column :debts, :debt, :cost
  end
end
