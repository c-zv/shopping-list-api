class ShoppingListItemSerializer < ActiveModel::Serializer
  attributes :id, :bought, :qty_to_buy, :store_product_id, :product, :store
end