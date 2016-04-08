class ChangeScaleOfPurchaseCosts < ActiveRecord::Migration
  def change
  	change_column :purchases, :cost, :decimal, :precision => 10, :scale => 2
  end
end
