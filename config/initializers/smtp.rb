ActionMailer::Base.smtp_settings = {
  address: "smtp.sendgrid.net",
  port: 587,
  domain: 'margatekipndip.co.uk',
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_API_KEY'],
  authentication: :login,
  enable_starttls_auto: true
}