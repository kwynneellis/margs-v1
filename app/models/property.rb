class Property < ApplicationRecord
  has_many :enquiries, dependent: :destroy

  validates :title, :description, :price_per_night, :minimum_nights, :cleaning_fee, :max_guests, :bedrooms, :bathrooms, :pet_friendly, presence: true

  GUESTS = (1..4)
end
