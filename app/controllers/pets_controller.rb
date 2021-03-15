class PetsController < ApplicationController

 before_action :set_pet, only: [:show, :edit, :update]
 before_action :require_login

    def new
        set_shelter
        @pet = @shelter.pets.build
    end

    def create
        #change this from .new to .build to create automatic associations
        #create new pet if shelter already exists
        @pet = Pet.new(pet_params)
        validation_check(@pet)
    end

    def show
    end
    
    def edit
        
    end

    def update
        if @pet.update(pet_params)
            redirect_to @pet
        else
            render :edit
        end
    end

    def index 
        if set_shelter
            @pets = @shelter.pets
        else
            @pets = Pet.all
        end
    end

    def dogs
            @pets = Pet.all.filter_dog.younger_age
    end
    def cats
            @pets = Pet.all.filter_cat.younger_age
    end

    private

    def set_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit!
    end

    def set_shelter
        @shelter = Shelter.find_by_id(params[:shelter_id])
    end
end
