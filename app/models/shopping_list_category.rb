class ShoppingListCategory < ApplicationRecord
  has_many :shopping_lists
end
