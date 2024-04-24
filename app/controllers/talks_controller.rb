class TalksController < ApplicationController
  expose(:happened_talks) { Talk.happened }

  expose(:lineup_talks) { Talk.lineup }

  expose(:proposed_talks) { Talk.proposed }

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      TalkMailer.new_talk(@talk.id).deliver_later
      @talk.send_slack_notification!
      redirect_to talks_path, notice: "Talk proposed successfully"
    else
      render action: :new
    end
  end

  private

  def talk_params
    params.require(:talk).permit(%i[duration
                                    level
                                    speaker_email
                                    speaker_name
                                    speaker_twitter
                                    preferred_month_talk
                                    title])
  end
end
