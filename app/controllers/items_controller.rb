class ItemsController < ApplicationController
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to cart_path(current_cart)
    end  

    def add_quantity
        @item = Item.find(params[:id])
        @item.quantity += 1
        @item.save
        redirect_to cart_path(current_cart)
    end
    
    def reduce_quantity
        @item = Item.find(params[:id])
        if @item.quantity > 1
            @item.quantity -= 1
        end
        @item.save
        redirect_to cart_path(current_cart)
    end
end