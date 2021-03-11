class ApplicationController < ActionController::Base

    
    helper_method :validation_check, :current_admin, :current_user, :logged_in?

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def current_admin
        @current_admin ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id]
    end

    def logged_in?
        !!current_user || !!current_admin
    end

    def require_login
        if !logged_in?
            flash[:message] = "You must be logged in to view this page!"
            redirect_to login_path 
        end
    end

    def validation_check(object)
        if object.save
            redirect_to object
        else
            render :new
        end
    end
end
