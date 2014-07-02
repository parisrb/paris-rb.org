class TalksController < ApplicationController
  expose(:next_talks) { Talk.to_come.order(created_at: :desc) }
  expose(:prev_talks) do
    Talk.happened.order(happened_at: :desc, created_at: :desc)
  end
  expose(:talk, attributes: :talk_params)

  def create
    if talk.save
      TalkMailer.new_talk(talk).deliver # TODO: use delayed job or similar
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
                                    title])
  end
end
