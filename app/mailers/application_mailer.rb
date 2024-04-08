# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@paris-rb.org"
  layout "mailer"
end
