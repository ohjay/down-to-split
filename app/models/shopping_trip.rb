class ShoppingTrip < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :payer, :class_name => "User", :foreign_key => "payer_id"
end
