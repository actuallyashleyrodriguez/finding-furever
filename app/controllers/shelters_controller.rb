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

    def edit
        if @shelter.update(shelter_params)
            redirect_to @shelter
        else
            render :edit
        end
    end

    private

    def set_shelter
        @shelter = Shelter.find(params[:id])
    end

    def shelter_params
        params.require(:shelter).permit!
    end
end
