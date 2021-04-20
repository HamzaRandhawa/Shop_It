class PagesController < ApplicationController
    def home
        # session[:user_id] = nil;

        @category = Category.first();
    end
    def about
    end
end
