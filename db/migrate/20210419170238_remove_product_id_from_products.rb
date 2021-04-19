class RemoveProductIdFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :product_id 
  end
end
