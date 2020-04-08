class TalksController < ApplicationController
  # expose(:lisneup_talks) { Talk.lineup }

  def index
    @talks_by_meetup = Talk.happened_by_meetup
  end

  def create
    talk = Talk.new
    @talk_form = TalkForm.new(talk)

    if @talk_form.validate(params[:talk]) && @talk_form.save
      TalkMailer.new_talk(talk).deliver_now
      redirect_to talks_path(anchor: :talks)
    else
      render action: :new
    end
  end
end
