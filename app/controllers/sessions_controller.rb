class SessionsController < ApplicationController
    before_action :require_logout, only: [:new]
    # before_action :require_login, only: [:create]


    def new
        
    end
    def create
        # render plain: params[:session]

        user = User.find_by(username: params[:session][:username].downcase);
        if user && user.authenticate(params[:session][:password])
            
            session[:user_id] = user.id;

            flash[:notice] = "Logged in Successfully";
            # redirect_to user_path(user);    
            # redirect_to users_path();    
            redirect_to root_path

        else
            flash.now[:alert] = "Incorrect Email or Password";
            # flash.now flashes the message now without waiting for redirected http request.
            render 'new'
        end
    end
    def destroy
        session[:user_id] = nil;
        flash[:notice] = "Logged Out";
        redirect_to root_path;    

    end
end