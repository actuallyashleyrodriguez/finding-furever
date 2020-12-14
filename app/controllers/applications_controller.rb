class ApplicationsController < ApplicationController
    def new
        @app = Application.new
    end


    private
    def app_params
        params.require(:shelter).permit!
    end
end
