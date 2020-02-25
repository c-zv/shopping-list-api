class ShoppingListItem < ApplicationRecord
  belongs_to :store_product
  belongs_to :shopping_list
end
