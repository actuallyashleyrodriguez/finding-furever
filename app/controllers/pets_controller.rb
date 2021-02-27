class PetsController < ApplicationController

    before_action :set_pet, only: [:show, :edit, :update]

    def new
        @shelter = Shelter.find_by_id(params[:shelter_id])
        @pet = @shelter.pets.build
    end

    def create
        #change this from .new to .build to create automatic associations
        #create new pet if shelter already exists
        @pet = Pet.new(pet_params)
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

    def index 
        if @shelter = Shelter.find_by_id(params[:shelter_id])
            @pets = @shelter.pets
        else
            @pets = Pets.all
        end
    end

    private

    def set_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit!
    end
end
