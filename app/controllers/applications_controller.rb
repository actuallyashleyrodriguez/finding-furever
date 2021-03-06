class ApplicationsController < ApplicationController
    def new
        @user = User.find_by_id(session[:user_id])
        @app = Application.new
    end

    def create
        @user = User.find_by_id(session[:user_id])
        @app = @user.applications.build(app_params)
        validation_check(@app)
    end

    def show
        @app = Application.find(params[:id])
    end


    private
    def app_params
        params.require(:application).permit(:user_id, :pet_name, :vet)
    end
end
