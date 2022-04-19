# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Transaction.destroy_all
Order.destroy_all
Customer.destroy_all
puts "All Destroyed"

# base_order_id = 535_000
# 50.times do
#   Order.create(id: base_order_id += 1)
# end
# puts "Orders Created"

# start_id = 12_000
# 50.times do
#   Customer.create(id: start_id += 1)
# end
# puts "Customers Created"

CSV.foreach(Rails.root.join('lib/autre-memory-tech-challenge-data.csv'), headers: true) do |row|
  Customer.create({
    customer_ref: row[2],
  })

  Order.create({
    order_ref: row[1],
  })

  Transaction.create({
    date: row[0],
    order_id: row[1],
    customer_id: row[2],
    country: row[3],
    product_code: row[4],
    product_description: row[5],
    quantity: row[6],
    unit_price: row[7]
  })
end
