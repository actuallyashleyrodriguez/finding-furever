class User < ApplicationRecord
    has_many :applications
    has_many :pets, through: :applications

    validates :email, uniqueness: true, presence: true 

    has_secure_password
end
