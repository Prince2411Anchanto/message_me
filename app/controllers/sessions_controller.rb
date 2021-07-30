class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]
    def new
    end
    
    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "You have sucessfully logged in!"
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash.now[:error] = "You entered wrong credentials"
            render 'new'
        end
    end
     def destroy
        session[:user_id] = nil
        flash[:success] = "Logged out successfully!"
        redirect_to login_path
     end

     private
     def logged_in_redirect
        if logged_in?
            flash[:error] = "You are already logged in. Logout to enter a new account!"
            redirect_to root_path
        end
     end
end