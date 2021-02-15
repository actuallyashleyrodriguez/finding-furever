class Shelter < ApplicationRecord
    has_many :pets
    has_many :applications, through: :pets
    belongs_to :admins

    accepts_nested_attributes_for :pets
end
