class SessionsController < ApplicationController

    def index
    end

    def new
       
    end
 
    def create
        byebug
        session[:email] = params[:email]
        redirect_to '/users/:id'
    end
end