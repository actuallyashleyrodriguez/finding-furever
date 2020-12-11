class Shelter < ApplicationRecord
    has_many :pets
    belongs_to :shelters
end
