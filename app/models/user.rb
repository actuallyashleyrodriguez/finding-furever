class User < ApplicationRecord
    has_many :applications
    has_many :pets, through: :applications

    has_secure_password
end
