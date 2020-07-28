class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :country, :address
end
