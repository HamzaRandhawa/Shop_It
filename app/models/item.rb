class Item < ApplicationRecord

    # belongs_to :cart
    
    # has_one :product

    belongs_to :product
    belongs_to :cart
  
    # has_many :item_products
    # has_many :products, through: :item_products


    # LOGIC
    def total_price
        self.quantity * self.product.price
    end

end