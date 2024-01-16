class EnquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiry_mailer.thanks.subject
  #
  def thanks
    @enquiry = params[:enquiry]
    @greeting = "Hi #{@enquiry.first_name.capitalize} 👋,"

    mail(
      to: @enquiry.email, 
      subject: "Going to MarGreat?"
    )
  end

  def new_enquiry
    @enquiry = params[:enquiry]

    mail(
      to: 'k.wynneellis@gmail.com', 
      subject: "New Marg-cation, coming in HOT"
    )
  end

end
