class AddDebtsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :debts, :text
  end
end
