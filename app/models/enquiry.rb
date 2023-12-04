class Enquiry < ApplicationRecord
  belongs_to :property

  validates :first_name, :last_name, :email, :check_in, :check_out, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
