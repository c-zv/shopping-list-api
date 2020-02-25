class CreateShoppingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_lists do |t|
      t.string :name

      t.timestamps
    end

    add_reference :shopping_list_items, :shopping_list, null: false, foreign_key: true
  end
end
