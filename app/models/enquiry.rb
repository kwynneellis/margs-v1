class Enquiry < ApplicationRecord
  belongs_to :property

  validates :first_name, :last_name, :email, :mobile, :check_in, :check_out, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  after_create :send_thanks_email, :send_new_enquiry_email

  private

  def send_thanks_email
    EnquiryMailer.with(enquiry: self).thanks.deliver_now
  end

  def send_new_enquiry_email
    EnquiryMailer.with(enquiry: self).new_enquiry.deliver_now
  end
end
