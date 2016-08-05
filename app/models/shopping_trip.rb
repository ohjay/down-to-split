class ShoppingTrip < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :payer, :class_name => "User", :foreign_key => "payer_id"
  has_and_belongs_to_many :users
end
