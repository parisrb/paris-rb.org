class TalkMailer < ActionMailer::Base
  default from: "no-reply@rubyparis.org"

  def new_talk(talk)
    @talk = talk
    mail(to: 'thibaut@milesrock.com', from: talk.speaker_email, subject: '[Paris.rb] New Talk: ' + talk.title) # TODO: add recepients
  end
end
