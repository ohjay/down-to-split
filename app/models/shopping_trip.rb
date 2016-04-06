class ShoppingTrip < ActiveRecord::Base
	belongs_to :vendor
	has_many :purchases
	has_and_belongs_to_many :users
	accepts_nested_attributes_for :purchases
	accepts_nested_attributes_for :users, reject_if: :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :vendor
	delegate :vendor_name, :to => :vendor, allow_nil: true
	attr_accessor :vendor_name
	has_many :debts
	accepts_nested_attributes_for :debt
end
