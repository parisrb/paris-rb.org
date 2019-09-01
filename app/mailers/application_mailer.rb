# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@rubyparis.org'
  layout 'mailer'
end
