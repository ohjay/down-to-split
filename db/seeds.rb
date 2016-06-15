# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Starter set for users
users = %w(Owen Sagang Oliver Jerry Kavi).to_a.map do |name|
  User.create! username: name, email: name + "@berkeley.edu", password: 'abcd1234', weekly_budget: 50.0
end

# Starter set for vendors
vendors = Array[
  (Vendor.create! vendor_name: "Trader Joe's", location: "1885 University Ave, Berkeley, CA 94703"),
  (Vendor.create! vendor_name: "Safeway", location: "6310 College Ave, Oakland, CA 94618"),
  (Vendor.create! vendor_name: "Berkeley Bowl", location: "2020 Oregon St, Berkeley, CA 94703")
]

# Starter set for products
products = Array[
  (Product.create! product_name: "Silly Putty"),
  (Product.create! product_name: "Tomatoes"),
  (Product.create! product_name: "Oliver Oil")
]

# Starter set for shopping trips
trips = Array[
  (ShoppingTrip.create! date: Time.at(rand * Time.now.to_i), vendor: vendors[0], total: 90, 
      payer: "Owen", users: Array[users[0], users[3]], name: vendors[0].vendor_name),
  (ShoppingTrip.create! date: Time.at(rand * Time.now.to_i), vendor: vendors[1], total: 50,
      payer: "Sagang", users: Array[users[1], users[3]], name: vendors[1].vendor_name),
  (ShoppingTrip.create! date: Time.at(rand * Time.now.to_i), vendor: vendors[2], total: 70,
      payer: "Oliver", users: Array[users[2], users[3]], name: vendors[2].vendor_name)
]

# Starter set for purchases
purchases = (1..6).to_a.map do |n|
  date = Time.at(rand * Time.now.to_i)
  cost = n * 10
  trip = trips[n % 3]
  vend = trip.vendor
  prod = products[rand(products.size)]
  
  Purchase.create! date_purchased: date, cost: cost, shopping_trip: trip, vendor: vend, product: prod, category: "Entertainment"
end

# Starter set for debts
debts = (1..6).to_a.map do |n|
  creditor = users[n % 3]
  trip = trips[n % 3]
  purch = purchases[n - 1]
  cost = purch.cost / 2
  
  Debt.create! cost: cost, creditor: creditor, debtor: users[3], purchase: purch, shopping_trip: trip
  creditor.expenses.create purchase: purch, percentage: 0.5
  users[3].expenses.create purchase: purch, percentage: 0.5
end
