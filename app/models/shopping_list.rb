class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: 'ShoppingListItem', foreign_key: 'shopping_list_id', dependent: :destroy
  belongs_to :category, class_name: 'ShoppingListCategory', foreign_key: 'shopping_list_category_id'

  validates :category, presence: true
end
