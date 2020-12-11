class PetsController < ApplicationController

    before_action :set_pet, only: [:show, :edit, :update]

    def new
        @pet = Pet.new
        @shelters = Shelter.all
    end

    def create
        @pet = Pet.new(pet_params)
        if @pet.save
            redirect_to @pet
        else
            render :new
        end
    end

    def show
    end

    private

    def set_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit(:name, :shelter_name, :breed, :animal_type, :age)
    end
end
