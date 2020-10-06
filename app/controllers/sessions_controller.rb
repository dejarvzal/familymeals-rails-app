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
        byebug
        User.find_or_create_by(email: auth[:info][:email])
        # User.where(email: auth[:info][:email]).first_or_initialize
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end