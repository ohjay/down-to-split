class Vendor < ActiveRecord::Base
  has_many :purchases
  has_many :shopping_trips, class_name: 'ShoppingTrip', foreign_key: 'vendor_id'
  accepts_nested_attributes_for :shopping_trips
end
