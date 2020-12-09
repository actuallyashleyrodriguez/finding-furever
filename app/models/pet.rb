class Pet < ApplicationRecord
    has_many :applications
    has_many :users, through: :applications
    belongs_to :shelter
end
