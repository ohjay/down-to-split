class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :shopping_trip
end
