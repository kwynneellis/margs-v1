class EnquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiry_mailer.thanks.subject
  #
  def thanks
    @greeting = "Hi there 👋,"

    mail to: "k.wynneellis@gmail.com", subject: "Going to MarGreat?"
  end
end
