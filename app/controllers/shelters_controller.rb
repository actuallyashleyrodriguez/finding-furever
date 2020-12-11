class SheltersController < ApplicationController
    before_action :set_shelter, only: [:show, :edit, :update]

    def new
        @shelter = Shelter.new
    end

    def create
        @shelter = Shelter.new(shelter_params)
        if @shelter.save
            redirect_to @shelter
        else
            render :new
        end
    end

    def show
    end

    private

    def set_shelter
        @shelter = Shelter.find(params[:id])
    end

    def shelter_params
        params.require(:shelter).permit!
    end
end
