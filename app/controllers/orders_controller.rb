class OrdersController < ApplicationController
    def index
        if current_user.admin?
            @orders = Order.all
        else
            @orders = Order.where(user_id: current_user.id)
        end
    end

    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new
    end

    def create
        #  render plain: params[:order]

        
        @order = Order.new(order_params)
        # byebug;
        current_cart.items.each do |item|
          @order.items << item
          item.cart_id = nil
        end
        @order.user_id = current_user.id
        if @order.save
            flash[:notice] = "Your Purchase Package is Shipped and will reach you soon.";

            Cart.destroy(session[:cart_id])
            session[:cart_id] = nil
            redirect_to root_path
        else
            flash[:alert] = "Ooooppss, something went wrong!"
            render 'new'
        end
      end
      
    private
    def order_params
        params.require(:order).permit(:name, :email, :address, :pay_method)
    end

end