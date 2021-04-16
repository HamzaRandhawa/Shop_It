class PagesController < ApplicationController
    def home
        @category = Category.first();
    end
    def about
    end
end
