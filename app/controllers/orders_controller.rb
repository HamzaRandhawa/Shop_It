class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new
    end

    def create
        #  render plain: params[:order]

        flash[:notice] = "Your Purchase Package is Shipped and will reach you soon.";
        
        @order = Order.new(order_params)
        # byebug;
        current_cart.items.each do |item|
          @order.items << item
          item.cart_id = nil
        end
        @order.user_id = current_user.id
        @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to root_path
      end
      
    private
    def order_params
        params.require(:order).permit(:name, :email, :address, :pay_method)
    end

end