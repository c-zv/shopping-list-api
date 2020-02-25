class CreateProductInStores < ActiveRecord::Migration[6.0]
  def change
    create_table :store_products do |t|
      t.integer :available_qty, null: false, default: 0
      t.string :store_prod_id, null: false
      t.decimal :price
      t.references :product, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end

    add_index :store_products, :store_prod_id, unique: true
  end
end
