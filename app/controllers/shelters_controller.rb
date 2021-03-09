class SheltersController < ApplicationController
    before_action :set_shelter, only: [:show, :edit, :update]
    before_action :require_login

    def new
        @shelter = Shelter.new
        @shelter.pets.build
    end

    def create
        @admin = Admin.find_by_id(session[:admin_id])
        @shelter = @admin.shelters.build(shelter_params)
        if @shelter.save
            redirect_to @shelter
        else
            flash[:errors] = @shelter.errors.full_messages
            render :new
        end
    end

    def show

    end

    def edit
    end

    def update
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
            :name, :age, :animal_type, :breed, :image_url
        ] )
    end
end
