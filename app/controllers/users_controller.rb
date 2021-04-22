class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_login, except: [:show, :index, :destroy, :create, :new]
    before_action :is_authenticated_user, only: [:edit, :update, :destroy]
    before_action :require_logout, only: [:new]
    def index
        @users = User.all();
        # @users = User.paginate(page: params[:page], per_page: 4)
    end

    def show
        # Creates instance variable with the value, and it will be available in htmo.erb view file.
        # @user = User.find(params[:id]);  # Will find Article with id of whatever is passed in params
        # @articles = @user.articles.paginate(page: params[:page], per_page: 4);
    end

    def new
        @user = User.new();
    end

    def create
         # render plain: params[:article]

        # require the Top level keys of users and permits username, email and password from there
        values = params.require(:user).permit(:username, :email, :password, :admin); #White Listing
        @user = User.new(values);
        
        # @article.user = User.first;
        
        if @user.save()

            # UserMailer.registration_confirmation(@user).deliver_now
            UserMailer.with(user: @user).registration_confirmation.deliver_now
            # UserMailer.registration_confirmation(@user)

            flash[:notice] = "Please confirm your email address to continue"
            redirect_to root_path

            # flash[:notice] = "Thanks for joining! Welcome #{@user.username}!"
            # session[:user_id] = @user.id;

            # # render plain: @user.inspect
            # redirect_to root_path
            # redirect_to user_path(@user);     # WOWWW! It's defining paths automatically. 
            # redirect_to @article;     # Same effect... JUST WOWWWW!!!
        else
            flash[:alert] = "Ooooppss, something went wrong!"
            render 'new'
         end
    end

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
          user.email_activate
          flash[:success] = "Welcome to the OpenShop! Your email has been confirmed.
          Please sign in to continue."
          redirect_to signin_url
        else
          flash[:error] = "Sorry. User does not exist"
          redirect_to root_url
        end
    end

    def edit
        # @user = User.find(params[:id]);
    end

    def update
         # render plain: params[:article]

        # require the Top level keys of users and permits username, email and password from there
        values = params.require(:user).permit(:username, :email, :password, :admin); #White Listing

        # @user = User.find(params[:id]);

        # @article.user = User.first;

        if @user.update(values)
            flash[:notice] = "Changes saved to Profile successfully!"
            # render plain: @user.inspect
            redirect_to user_path(@user);     # WOWWW! It's defining paths automatically. 
            # redirect_to @article;     # Same effect... JUST WOWWWW!!!
        else
            render 'edit'
         end
    end

    def destroy
        @user.destroy();
        # session[:user_id] = @user.id;
        session[:user_id] = nil;
        flash[:notice]= "Account and all associated Articles Deleted.";
        redirect_to root_path;
    end

    private
    def set_user
        @user = User.find(params[:id]);  # Will find Article with id of whatever is passed in params
        
    end

    def is_authenticated_user
        if current_user != @user
            flash[:alert] = "You Can only Edit your Account.";
            redirect_to @user;
        end
    end

    def is_Admin
        if !current_user.admin?
            flash[:alert] = "Only Admin can perform this action.";
            redirect_to @user;
        end
    end
   

end