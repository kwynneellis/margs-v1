class Property < ApplicationRecord
  has_many :enquiries, dependent: :destroy

  GUESTS = (1..4)
end
