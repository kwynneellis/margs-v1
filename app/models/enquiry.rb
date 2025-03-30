class Enquiry < ApplicationRecord
  belongs_to :property

  validates :first_name, :last_name, :email, :mobile, :check_in, :check_out, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :mobile, :presence => true, :numericality => true, :length => { :minimum => 11, :maximum => 15 }
  validates :nights_of_stay, numericality: { greater_than_or_equal_to: 1 }
  validates_comparison_of :check_out, greater_than: :check_in, other_than: Date.today

  after_create :send_thanks_email, :send_new_enquiry_email

  def nights_of_stay
    (check_out - check_in).to_i
  end

  private

  def send_thanks_email
    EnquiryMailer.with(enquiry: self).thanks.deliver_now
  end

  def send_new_enquiry_email
    EnquiryMailer.with(enquiry: self).new_enquiry.deliver_now
  end
end
