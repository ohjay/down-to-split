class AddCategoryToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :category, :string
  end
end
