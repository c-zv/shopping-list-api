class StoreProduct < ApplicationRecord
  belongs_to :product
  belongs_to :store
  has_many :shopping_list_items
end
