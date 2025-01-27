class ShoppingListItem < ApplicationRecord
  belongs_to :store_product
  belongs_to :shopping_list

  has_one :store, through: :store_product
  has_one :product, through: :store_product

  validates :qty_to_buy, numericality: { only_integer: true }

end
