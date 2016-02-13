class AlterPercentageTypeInExpenses < ActiveRecord::Migration
  def up
    change_column :expenses, :percentage, :float
  end

  def down
    change_column :expenses, :percentage, :integer
  end
end
