class SessionsController < ApplicationController

    def index
    end

    def new
       
    end
 
    def create
        user = User.find_by(email: params[:user][:email]) 
        if user && user.authenticate(params[:user][:password]) 
            session[:user_id] = user.id
            redirect_to user
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def admin_new
       
    end
 
    def admin_create
        admin = Admin.find_by(email: params[:admin][:email]) 
        if admin && admin.authenticate(params[:admin][:password]) 
            session[:admin_id] = admin.id
            redirect_to admin
        else
            redirect_to admin_login_path
        end
    end

end