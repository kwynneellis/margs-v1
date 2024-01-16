# Preview all emails at http://localhost:3000/rails/mailers/enquiry_mailer
class EnquiryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/enquiry_mailer/thanks
  def thanks
    enquiry = Enquiry.last
    
    EnquiryMailer.with(enquiry: enquiry).thanks
  end

  def new_enquiry
    enquiry = Enquiry.last
    
    EnquiryMailer.with(enquiry: enquiry).new_enquiry
  end

end
