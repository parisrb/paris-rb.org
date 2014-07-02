class TalkMailer < ActionMailer::Base
  default from: 'no-reply@rubyparis.org'

  def new_talk(talk)
    @talk = talk
    mail to: ['thibaut@milesrock.com', 'scourtois@cubyx.fr', 'sylvain.abelard+rails@gmail.com'],
         from: talk.speaker_email,
         subject: "[Paris.rb] New Talk: #{talk.title}"
  end
end
