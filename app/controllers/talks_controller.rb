class TalksController < ApplicationController
  expose(:happened_talks) { Talk.happened }

  expose(:lineup_talks) { Talk.lineup }

  expose(:proposed_talks) { Talk.proposed }

  expose(:talk, attributes: :talk_params ) 

  def create
    if talk.save
      TalkMailerWorker.new.async.perform(talk.id)
      redirect_to talks_path(anchor: :talks)
    else
      render action: :index
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
                                      .merge!(skip_twitter_validations: true)
  end
end
