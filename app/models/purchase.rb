class Purchase < ActiveRecord::Base
  has_many :expenses, :class_name => 'Expense'
  has_many :users, :through => :expenses
  belongs_to :product
  belongs_to :vendor
end
