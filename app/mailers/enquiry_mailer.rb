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
      bcc: 'k.wynneellis@gmail.com',
      subject: "Thanks for your enquiry"
    )
  end

  def new_enquiry
    @enquiry = params[:enquiry]

    mail(
      to: 'margatekipndip@gmail.com', 
      bcc: 'k.wynneellis@gmail.com',
      subject: "Marg-cation enquiry, coming in HOT"
    )
  end

end
