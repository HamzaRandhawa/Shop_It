class Item < ApplicationRecord

    belongs_to :cart
    
    has_one :product
  
    # has_many :item_products
    # has_many :products, through: :item_products

end