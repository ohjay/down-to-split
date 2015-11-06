class AddWeeklyBudgetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :weekly_budget, :decimal
  end
end
