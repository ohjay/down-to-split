class Purchase < ActiveRecord::Base
  has_many :expenses, :class_name => 'Expense'
  has_many :users, :through => :expenses
  belongs_to :product
  belongs_to :vendor
  belongs_to :shopping_trip
  delegate :product_name, :to => :product, allow_nil: true
  accepts_nested_attributes_for :users, :expenses

  def self.weeks_purchases
	 where(:date_purchased => Date.today.beginning_of_week..Date.today.end_of_week)
  end
end
