class AddCreditorIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :creditor_id, :integer
  end
end
