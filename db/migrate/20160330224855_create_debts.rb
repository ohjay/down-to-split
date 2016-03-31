class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.float :debt

      t.timestamps null: false
    end
  end
end
