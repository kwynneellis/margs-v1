class Property < ApplicationRecord
  has_many :enquiries, dependent: :destroy
end
