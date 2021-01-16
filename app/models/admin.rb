class Admin < ApplicationRecord
    has_many :shelters
    has_many :pets, through: :shelters
    validates :email, uniqueness: true, presence: true
    
    has_secure_password
end
