class TalkMailer < ApplicationMailer
  def new_talk(talk)
    @talk = talk
    mail to: ['thibaut@milesrock.com', 'sylvain.abelard+rails@gmail.com'],
         from: 'no-reply@rubyparis.org',
         reply_to: talk.speaker_email,
         subject: "[Paris.rb] New Talk: #{talk.title}"
  end
end
