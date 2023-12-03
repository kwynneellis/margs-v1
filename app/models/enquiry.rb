class Enquiry < ApplicationRecord
  belongs_to :property

  validates :first_name, :check_in, :check_out, presence: true
end
