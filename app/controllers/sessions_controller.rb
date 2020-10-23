class SessionsController < ApplicationController
    
    def welcome
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/', notice: "Logged out!"
    end

    def new
    end

    def create
    #    byebug 
       @user = User.find_by(name: params[:user][:name])
    # if @user && @user.authenticate(params[:user][:password])
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            flash[:error] = "Sorry, your login info was incorrect. Please try again"
            redirect_to login_path
        end
    end

    def omniauth
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end

    

    private

    def auth
        request.env['omniauth.auth']
    end
end