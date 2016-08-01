class Expense < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :user
end
