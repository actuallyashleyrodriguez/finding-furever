class Pet < ApplicationRecord
    has_many :applications
    has_many :users, through: :applications
    belongs_to :shelter
    validates :name, :animal_type, :breed, presence: true

    def shelter_name=(name)
        shelter = Shelter.find_or_create_by(name: name)
        self.shelter = shelter
    end

    def shelter_name
        self.shelter ? self.shelter : nil
    end
end
