class RemoveItemIdsFromCarts < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :item_id 
  end
end
