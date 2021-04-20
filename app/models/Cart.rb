class Cart < ApplicationRecord

    belongs_to :user
    # has_many :items

    has_many :items, dependent: :destroy
    has_many :products, through: :items

    # LOGIC
    def sub_total
        sum = 0
        self.items.each do |item|
        sum+= item.total_price
        end
        return sum
    end

    # def add_item(product_id)
    #     item = Item.find_by({product_id: product_id})
    #     if item
    #         # increase the quantity of product in cart
    #         item.quantity = item.quantity + 1
    #         item.save()
    #     else

    #         # product does not exist in cart
    #         # byebug;
    #         current_cart.items << Item.new(product_id: product_id, quantity: 1);
    #         # new_item.save()
    #         # end
    #     end
    #     # save
    # end
      

end