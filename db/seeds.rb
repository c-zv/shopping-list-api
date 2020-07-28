# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

num_products = 20
num_stores = 3
num_shop_lists = 4

num_stores.times do
  Store.create({
    name: Faker::Company.name,
    city: Faker::Address.city,
    country: Faker::Address.country,
    address: Faker::Address.street_address
    })
  end

num_products.times do
  prod = Product.create({
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    global_id: Faker::Alphanumeric.alphanumeric(number: 10)
  })
  StoreProduct.create({
    product: prod,
    store: Store.all[rand(num_stores)],
    available_qty: Faker::Number.number(digits: 2),
    store_prod_id: Faker::Alphanumeric.alphanumeric(number: 8),
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2)
  })
end

categories = [
  {
    name: 'Tech',
    color: '#8da0cb'
  },
  {
    name: 'Food',
    color: '#fc8d62'
  },
  {
    name: 'Regular',
    color: '#66c2a5'
  }
]

categories.each do |cat|
  ShoppingListCategory.create(cat)
end

User.create({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
})


num_shop_lists.times do
  shopping_list = ShoppingList.create({
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    user: User.first,
    category: ShoppingListCategory.all.sample
  })

  num_items = rand(2..6)
  store_products = StoreProduct.all.sample(num_items)
  num_items.times do |index|
    ShoppingListItem.create({
      qty_to_buy: Faker::Number.number(digits: 1),
      store_product: store_products[index],
      shopping_list: shopping_list
    })
  end
end

