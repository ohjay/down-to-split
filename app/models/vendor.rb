class Vendor < ActiveRecord::Base
  has_many :purchases
  has_many :shopping_trips
  accepts_nested_attributes_for :shopping_trips, :allow_destroy => true
  accepts_nested_attributes_for :purchases, :allow_destroy => true
end
