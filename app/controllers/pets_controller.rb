class PetsController < ApplicationController

    before_action :set_pet, only: [:show, :edit, :update]

    def new
        @pet = Pet.new
        @shelters = Shelter.all
    end

    def create
        #change this from .new to .build to create automatic associations
        #create new pet if shelter already exists
        @shelter = shelter_name=(params[:pet][:shelter_name]) #change view to datalist view
        @pet = @shetler.pets.build(pet_params)
        if @pet.save
            redirect_to @pet
        else
            render :new
        end
    end

    def show
    end
    
    def edit
        if @pet.update(pet_params)
            redirect_to @pet
        else
            render :edit
        end
    end

    private

    def set_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit(:name, :shelter_name, :breed, :animal_type, :age)
    end
end
