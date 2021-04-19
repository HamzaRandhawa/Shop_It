class AddItemsToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :item_id, :int 
  end
end
