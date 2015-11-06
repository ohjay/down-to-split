class Purchase < ActiveRecord::Base
  has_many :expenses, :class_name => 'Expense'
  has_many :users, :through => :expenses
end
