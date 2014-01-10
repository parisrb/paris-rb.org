class TalksController < ApplicationController
  expose(:talks) { Talk.order(created_at: :desc) }
  expose(:talk, attributes: :talk_params)

  def create
    if talk.save
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
