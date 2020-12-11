class Admin < ApplicationRecord
    has_many :shelters
    has_many :pets, through: :shelters
end
