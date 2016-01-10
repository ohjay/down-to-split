class Purchase < ActiveRecord::Base
  has_many :expenses, :class_name => 'Expense'
  has_many :users, :through => :expenses
  belongs_to :product
  belongs_to :vendor
  delegate :product_name, :to => :product, allow_nil: true
  accepts_nested_attributes_for :users, :expenses
end
