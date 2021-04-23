class PagesController < ApplicationController
    def home
        # session[:user_id] = nil;

        # redirect_to login_url

        # redirect_to login_path
        # redirect_to '/login'
        

        

        @category = Category.first();
    end
    def about
    end
end
