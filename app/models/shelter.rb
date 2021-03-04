class Shelter < ApplicationRecord
    has_many :pets
    has_many :applications, through: :pets
    belongs_to :admin

    accepts_nested_attributes_for :pets

    validates :name, presence: true
    validates :address, uniqueness: true, presence: true

    #scope :filtered_state, ->(state) { where('address like ?', "#{state}%")}
    #scope :filter_city, ->(city) { filtered_state.where('address like ?', "#{city}%")}
    
end
