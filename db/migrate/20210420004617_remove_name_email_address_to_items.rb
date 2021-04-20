class RemoveNameEmailAddressToItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :name
    remove_column :items, :email 
    remove_column :items, :address 
  end
end
