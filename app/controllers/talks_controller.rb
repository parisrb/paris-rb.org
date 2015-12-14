class TalksController < ApplicationController
  expose(:happened_talks) { Talk.happened }

  expose(:lineup_talks) { Talk.lineup }

  expose(:proposed_talks) { Talk.proposed }

  expose(:talk, attributes: :talk_params)

  def index
    @talks = Talk.order("position")
  end

  def create
    if talk.save
      TalkMailerWorker.new.async.perform(talk.id)
      redirect_to talks_path(anchor: :talks)
    else
      render action: :index
    end
  end

  def sort
    params[:talk].each_with_index do |id, index|
      Talk.update_all({position: index+1}, {id: id})
    end
    render nothing: true
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
