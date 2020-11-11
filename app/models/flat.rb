class Flat < ApplicationRecord
  validates :name, :address, :price_per_night, :number_of_guests, presence: true
  validates :price_per_night, :number_of_guests, numericality: { only_integer: true, message: "%{value} should be a number" }
end
