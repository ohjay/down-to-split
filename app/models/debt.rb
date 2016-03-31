class Debt < ActiveRecord::Base
	has_one :creditor, :class_name => "User", :foreign_key => "creditor_id"
	has_one :debtor, :class_name => "User", :foreign_key => "debtor_id"

	def self.debt_owed(user1, user2)
		@credits = where(creditor: user1)
		@total_credit = 0
		@credits.each do |credit|
			@total_credit += credit.cost
		end

		@debts = where(debtor: user1)
		@total_debt = 0
		@debts.each do |debt|
			@total_debt += debt
		end

		return @total_credit - @total_debt
	end
end