# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

prod1 = Product.create({
  name: Faker::Commerce.product_name,
  description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
  global_id: Faker::Alphanumeric.alphanumeric(number: 10)
})

store1 = Store.create({
  name: Faker::Company.name,
  city: Faker::Address.city,
  country: Faker::Address.country,
  address: Faker::Address.street_address
})

store_prod1 = StoreProduct.create({
  product: prod1,
  store: store1,
  available_qty: Faker::Number.number(digits: 2),
  store_prod_id: Faker::Alphanumeric.alphanumeric(number: 8),
  price: Faker::Number.decimal(l_digits: 2, r_digits: 2)
})

user1 = User.create({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
})

shopping_list1 = ShoppingList.create({
  name: Faker::Lorem.word,
  user: user1
})

shopping_item1 = ShoppingListItem.create({
  qty_to_buy: Faker::Number.number(digits: 1),
  store_product: store_prod1,
  shopping_list: shopping_list1
})
