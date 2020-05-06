class ShoppingListItem < ApplicationRecord
  belongs_to :store_product
  belongs_to :shopping_list

  has_one :store, through: :store_product

end
