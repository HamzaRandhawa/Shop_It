class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :edit, :update, :destroy]
    before_action :require_login, except: [:show, :index]
    before_action :is_Admin, only: [:edit, :update, :destroy]

    def index
        @carts = Cart.all();
        # @users = User.paginate(page: params[:page], per_page: 4)
    end

    def show
        # byebug;
        # Creates instance variable with the value, and it will be available in htmo.erb view file.
        # @product = Product.find(params[:id]);  # Will find Article with id of whatever is passed in params
        # @articles = @user.articles.paginate(page: params[:page], per_page: 4);
    end

    def add_to_cart

        # Find associated product and current cart
        chosen_product = Product.find(params[:product_id])
        # current_cart = @current_cart

        # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
        if current_cart.products.include?(chosen_product)
            # Find the line_item with the chosen_product
            @item = current_cart.items.find_by(:product_id => chosen_product)
            # Iterate the line_item's quantity by one
            @item.quantity += 1
        else
            @item = Item.new({quantity: 1});
            @item.cart = current_cart
            @item.product = chosen_product
        end

        # Save and redirect to cart show path
        @item.save
        redirect_to cart_path(current_cart)

        # byebug;
        # alert("Adding to Cart");
        # render plain: params[:product_id]

        # session[:cart_id] = nil;

        # add_item(params[:product_id])
        # current_cart.user = current_user;
        
        # flash.now[:notice] = "Product has been added to Cart successfully!"
        # redirect to shopping cart or whereever
    end

    # def new
    #     @cart = Cart.new();
    # end

    # def create
    #     # render plain: params[:article]

    #     # require the Top level keys of article and permits title and description from there
    #     # values = params.require(:article).permit(:title, :description); #White Listing
    #     @cart = Cart.new(white_listed_params);
        
    #     # img_values = params.require(:article).permit(:image);
    #     # img_values.foreach do|img|
    #     #     image = Image.new(img);
    #     #     prouct.build_image(image);
    #     # end
    #     # # @article.user = current_user;

    #     if @cart.save()
    #         flash[:notice] = "art has been created successfully!"
    #         # render plain: @article.inspect
    #         redirect_to cart_path(@cart);     # WOWWW! It's defining paths automatically. 
    #         # redirect_to @article;     # Same effect... JUST WOWWWW!!!
    #     else
    #         render 'new'
    #      end
    # end

    # def edit 
    #     # @article = Article.find(params[:id]);  # Will find Article with id of whatever is passed in params
    # end

    # def update 
    #     # @article = Article.find(params[:id]);  # Will find Article with id of whatever is passed in params
    #     # values = params.require(:article).permit(:title, :description);     #White Listing
    #      if @cart.update(white_listed_params);
    #         flash[:notice] = "Article is Updated successfully!"
    #         # render plain: @article.inspect
    #         redirect_to cart_path(@cart);     # WOWWW! It's defining paths automatically. 
    #         # redirect_to @article;     # Same effect... JUST WOWWWW!!!
    #     else
    #         render 'edit'
    #      end
    # end

    # def destroy
    #     # @article = Article.find(params[:id]);  # Will find Article with id of whatever is passed in params
    #     @cart.destroy;
    #     redirect_to carts_path
    # end

    private
    def set_cart
        @cart = Cart.find(params[:id]);  # Will find Article with id of whatever is passed in params
    end

    def white_listed_params
        params.require(:cart).permit(:name, :price, :description, category_ids: []);
    end

    def is_Admin
        if !current_user.admin?
            flash[:alert] = "Only Admin can perform this action.";
            redirect_to @cart;
        end
    end

    def add_item(product_id)
        item = Item.find_by({product_id: product_id})
        if item
            # increase the quantity of product in cart
            item.quantity = item.quantity + 1
            item.save()
        else
            # product does not exist in cart
            # byebug;
            current_cart.items << Item.new(product_id: product_id, quantity: 1);
            # new_item.save()
            # end
        end
        # save
    end

 
end