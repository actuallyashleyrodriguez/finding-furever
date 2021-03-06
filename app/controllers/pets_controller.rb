class PetsController < ApplicationController

    before_action :set_pet, only: [:show, :edit, :update]

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
            @pets = Pets.all
        end
    end

    def dogs
        if set_shelter
            @pets = @shelter.pets.filter_dog
        else
            @pets = Pet.all.filter_dog
        end
    end
    def cats
        if set_shelter
            @pets = @shelter.pets.filter_cat
        else
            @pets = Pet.all.filter_cat
        end
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
