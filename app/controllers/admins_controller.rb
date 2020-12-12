class AdminsController < ApplicationController

    before_action :set_admin, only: [:show, :edit, :update]

    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            redirect_to @admin
        else
            render :new
        end
    end

    def show
    end

    private

    def set_admin
        @admin = Admin.find(params[:id])
    end

    def admin_params
        params.require(:admin).permit!
    end
end
