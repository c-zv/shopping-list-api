class StoreProductSerializer < ActiveModel::Serializer
  attributes :id, :store_id, :available_qty, :price
  belongs_to :product
end