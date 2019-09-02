class TalkMailer < ApplicationMailer
  def new_talk(talk_id)
    @talk = Talk.find(talk_id)
    mail to: ['thibaut@milesrock.com', 'scourtois@cubyx.fr', 'sylvain.abelard+rails@gmail.com'],
         reply_to: @talk.speaker_email,
         subject: "[Paris.rb] New Talk: #{@talk.title}"
  end
end
