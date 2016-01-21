class ShoppingTrip < ActiveRecord::Base
	belongs_to :vendor
	has_many :purchases 
	has_and_belongs_to_many :users
	accepts_nested_attributes_for :purchases
end
