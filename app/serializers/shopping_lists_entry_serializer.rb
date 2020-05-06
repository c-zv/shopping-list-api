class ShoppingListsEntrySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :num_bought_items, :num_missing_items, :num_stores
  belongs_to :category

  def num_bought_items
    num_bought = 0
    object.items.each do |item|
      num_bought += 1 if item.bought
    end
    num_bought
  end

  def num_missing_items
    num_missing = 0
    object.items.each do |item|
      num_missing += 1 unless item.bought
    end
    num_missing
  end

  def num_stores
    num_different_stores = Set.new
    object.items.each do |item|
      num_different_stores.add(item.store)
    end
    num_different_stores.length
  end
end
