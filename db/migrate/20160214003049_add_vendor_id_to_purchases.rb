class AddVendorIdToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :vendor_id, :integer
  end
end
