class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase
  delegate :purchase, :to => :purchase, allow_nil: true
end
