class Product < ActiveRecord::Base
  has_many :purchases
  validates :product_name, uniqueness: true, presence: true
  accepts_nested_attributes_for :purchases
end
