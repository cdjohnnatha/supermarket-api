# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Role.create([
  { name: "user" },
  { name: "admin" }
])

User.create([name: "admin_user", email: "super_user@user.com", password: "superuseradmin"])
User.create([name: "cd", email: "cd@test.com", password: "123456789"])
Supermarket.create([name: "Supermarket 1", description: "Supermarket with many things"])
Product.create([name: "Product 1", description: "product 1 is the best of them", barcode: "ASDF1", brand: "Nestle"])
Product.create([name: "Product 2", description: "product 2 is the best of them", barcode: "ASDF2", brand: "Nestle"])
