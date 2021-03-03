class Application < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  def pet_name=(name)
        pet = Pet.find_or_create_by(name: name)
        self.pet = pet
  end

  def pet_name
        self.pet ? self.pet : nil
  end

end
