# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

purchases = (1..6).to_a.map do |n|
  rand_date = Time.at(rand * Time.now.to_i)
  rand_cost = rand(1..100)
  
  Purchase.create! date_purchased: rand_date, cost: rand_cost
end

%w(Owen Sagang Jerry Oliver Kavi).each do |name|
  user = User.create! username: name, email: name + "@berkeley.edu", password: 'abcd1234', weekly_budget: 50.00
  user.expenses.create purchase: purchases[rand(purchases.size)]
end
