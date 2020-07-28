class CreateShoppingListCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_list_categories do |t|
      t.string :name, null: false
      t.string :color, null: false
      t.timestamps
    end

    add_reference :shopping_lists, :shopping_list_category, foreign_key: true
  end
end
