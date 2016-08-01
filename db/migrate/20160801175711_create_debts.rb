class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.float :cost
      t.integer :creditor_id
      t.integer :debtor_id

      t.timestamps null: false
    end
  end
end
