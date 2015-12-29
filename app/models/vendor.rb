class Vendor < ActiveRecord::Base
  has_many :purchases
end
