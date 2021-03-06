class ApplicationController < ActionController::Base

    #before_action :require_login
    helper_method :validation_check

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
        redirect_to '/' if !logged_in?
    end

    def validation_check(object)
        if object.save
            redirect_to object
        else
            render :new
        end
    end
end
