class Admin < ApplicationRecord
    has_many :shelters
    has_many :pets, through: :shelters
    
    has_secure_password
end
