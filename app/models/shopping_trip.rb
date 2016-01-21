class ShoppingTrip < ActiveRecord::Base
	belongs_to :vendor, class_name: 'Vendor', foreign_key: 'shopping_trip_id'
	has_many :purchases 
	has_and_belongs_to_many :users
	accepts_nested_attributes_for :purchases
end
