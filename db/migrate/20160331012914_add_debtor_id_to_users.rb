class AddDebtorIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :debtor_id, :integer
  end
end
