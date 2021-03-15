class Pet < ApplicationRecord
    has_many :applications
    has_many :users, through: :applications
    belongs_to :shelter
    validates :name, :animal_type, :breed, :image_url, presence: true

    scope :filter_dog, ->{where(animal_type: 'Dog').order(:name) }
    scope :filter_cat, ->{where(animal_type: 'Cat').order(:name) }
    scope :younger_age, ->{where("age < 5")}

    #def shelter_name=(name)
     ##   shelter = Shelter.find_or_create_by(name: name)
     #   self.shelter = shelter
   # end

   # def shelter_name
   #     self.shelter ? self.shelter : nil
   # end
end
