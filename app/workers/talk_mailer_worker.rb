class TalkMailerWorker
  include SuckerPunch::Job

  def perform(talk_id)
    talk = Talk.find(talk_id)
    TalkMailer.new_talk(talk).deliver
  end
end
