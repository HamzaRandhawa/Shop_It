class ApplicationController < ActionController::Base

    # We extracted this method here so that it gets available to out controllers but now it is not
    # available in our views (as it is not helper mothods now. Solution??) 
    # Helper methods shows in Views only.

    helper_method :current_user, :logged_in?, :require_login, :current_cart     #Now it's helper method too.

    def current_cart
        if session[:cart_id]
            # Memoization
            @current_cart ||= Cart.find(session[:cart_id])
            # session[:cart_id] = nil;
        end
        if session[:cart_id].nil?
            cart = Cart.create({user_id: current_user.id})
            if cart.save();
                @current_cart = cart;
                session[:cart_id] = @current_cart.id
            end
        end
        @current_cart
    end 

    def current_user
        if session[:user_id]
            # Memoization
            @current_user ||= User.find(session[:user_id]);
        end
    end
    
    def logged_in?
        # "!!" To convert the value into Boolian 
        !!current_user 
    end

    def require_login
        if !logged_in? 
            flash[:alert] = "You must be Logged In to Perform this action.";
            redirect_to login_path;
        end
    end
    def require_logout
        if logged_in? 
            flash[:alert] = "You must be Logged Out to Perform this action.";
            redirect_to root_path;
        end
    end

    def is_Admin
        if !current_user.admin?
            flash[:alert] = "Only Admin can perform this action.";
            redirect_to root_path;
        end
    end
end
