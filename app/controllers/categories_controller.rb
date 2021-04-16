class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :require_login, except: [:show, :index]
    before_action :is_Admin, only: [:edit, :update, :destroy]

    def index
        @categories = Category.all();
        # @users = User.paginate(page: params[:page], per_page: 4)
    end

    def show
        # Creates instance variable with the value, and it will be available in htmo.erb view file.
        # @product = Product.find(params[:id]);  # Will find Article with id of whatever is passed in params
        # @articles = @user.articles.paginate(page: params[:page], per_page: 4);
    end


    def new
        @category = Category.new();
    end

    def create
        # render plain: params[:article]

        # require the Top level keys of article and permits title and description from there
        # values = params.require(:article).permit(:title, :description); #White Listing
        @category = Category.new(white_listed_params);
        
        # img_values = params.require(:article).permit(:image);
        # img_values.foreach do|img|
        #     image = Image.new(img);
        #     prouct.build_image(image);
        # end
        # # @article.user = current_user;

        if @category.save()
            flash[:notice] = "Category has been created successfully!"
            # render plain: @article.inspect
            redirect_to category_path(@category);     # WOWWW! It's defining paths automatically. 
            # redirect_to @article;     # Same effect... JUST WOWWWW!!!
        else
            render 'new'
         end
    end

    def edit 
        # @article = Article.find(params[:id]);  # Will find Article with id of whatever is passed in params
    end

    def update 
        # @article = Article.find(params[:id]);  # Will find Article with id of whatever is passed in params
        # values = params.require(:article).permit(:title, :description);     #White Listing
         if @category.update(white_listed_params);
            flash[:notice] = "Article is Updated successfully!"
            # render plain: @article.inspect
            redirect_to category_path(@category);     # WOWWW! It's defining paths automatically. 
            # redirect_to @article;     # Same effect... JUST WOWWWW!!!
        else
            render 'edit'
         end
    end

    def destroy
        # @article = Article.find(params[:id]);  # Will find Article with id of whatever is passed in params
        @article.destroy;
        redirect_to categories_path
    end

    private
    def set_category
        @category = Category.find(params[:id]);  # Will find Article with id of whatever is passed in params
    end

    def white_listed_params
        params.require(:category).permit(:name, :description);
    end


    def is_Admin
        if !current_user.admin?
            flash[:alert] = "Only Admin can perform this action.";
            redirect_to @category;
        end
    end

 
end