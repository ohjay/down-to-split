class Debt < ActiveRecord::Base
	belongs_to :creditor, :class_name => "User", :foreign_key => "creditor_id"
	belongs_to :debtor, :class_name => "User", :foreign_key => "debtor_id"
	belongs_to :shopping_trip
	delegate :name, :to => :shopping_trip, allow_nil: true
	delegate :date, :to => :shopping_trip, allow_nil: true
	belongs_to :purchase
	
	def self.debt_owed(user)
		@owed = Hash.new

		@credits = self.where(creditor: user)
		@credits.each do |credit|
			if @owed.has_key?(credit.debtor.username)
        @owed[credit.debtor.username] += credit.cost
      else
        @owed[credit.debtor.username] = credit.cost
      end
		end

		@debts = self.where(debtor: user)
		@debts.each do |debt|
			if @owed.has_key?(debt.creditor.username)
        @owed[debt.creditor.username] -= debt.cost
      else 
        @owed[debt.creditor.username] = -debt.cost
      end
		end
		return @owed
	end
end