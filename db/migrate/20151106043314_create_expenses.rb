class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.belongs_to :user, index: true
      t.belongs_to :purchase, index: true
      t.decimal :amount
      t.timestamps null: false
    end
  end
end
