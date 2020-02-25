class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :city
      t.string :country
      t.string :address

      t.timestamps
    end
  end
end
