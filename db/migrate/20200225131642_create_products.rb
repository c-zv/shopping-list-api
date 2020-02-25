class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, limit: 500
      t.string :global_id, null: false

      t.timestamps
    end

    add_index :products, :global_id, unique: true
  end
end
