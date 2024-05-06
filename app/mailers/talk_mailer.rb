class TalkMailer < ApplicationMailer
  def new_talk(talk)
    # this is a legacy mail, the mails are not sent as the Sendgird account is not active
    # but let'st keep it in case we revive the account
    @talk = talk
    mail to: ENV["EMAIL_RECIPIENTS"].presence || "meetupparisrb@gmail.com",
         reply_to: talk.speaker_email,
         subject: "[Paris.rb] New Talk: #{talk.title}"
  end
end
