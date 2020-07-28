class CreateShoppingListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_list_items do |t|
      t.integer :qty_to_buy
      t.boolean :bought, default: false
      t.references :store_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
