class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('no-reply@margatekipndip.co.uk', 'Margate Kip n Dip')
  layout 'mailer'
end
