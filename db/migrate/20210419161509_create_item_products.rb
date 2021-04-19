class CreateItemProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :item_products do |t|

      t.integer :item_id
      t.integer :product_id

      t.timestamps
    end
  end
end
