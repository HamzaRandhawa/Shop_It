class AddOrderIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :order_id, :int 
  end
end
