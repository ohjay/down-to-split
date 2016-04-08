class RenameAmountToPercentage < ActiveRecord::Migration
  def change
  	rename_column :expenses, :amount, :percentage
  end
end
