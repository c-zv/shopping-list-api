class ShoppingListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :category
  has_many :items
end