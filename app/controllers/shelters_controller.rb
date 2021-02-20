class SheltersController < ApplicationController
    before_action :set_shelter, only: [:show, :edit, :update]

    def new
        @admin= Admin.find_by_id(params[:admin_id])
        @shelter = @admin.shelters.build
        @shelter.pets.build
    end

    def create
        #change this from .new to .build to create automatic associations
        #create new shelter if admin already exists
        @shelter = Shelter.new(shelter_params)
        @shelter.admin_id = session[:admin_id]
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

    def index
        @shelter = Shelter.all
    end

    private

    def set_shelter
        @shelter = Shelter.find(params[:id])
    end

    def shelter_params
        params.require(:shelter).permit(:name, :address, :phone_number, :admin_id, pets_attributes: [
            :name, :age, :animal_type, :breed
        ] )
    end
end
