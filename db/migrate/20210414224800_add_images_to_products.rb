class AddImagesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :img_id, :int 

  end
end
